import 'dart:typed_data';
import 'package:hopapp/src/models/geoLocationDataModel.dart';
import 'package:hopapp/src/pages/home/tab_map/infohop_bottom_sheet.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/utils/utils.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/models/barfavoritoModel.dart';
import 'package:hopapp/src/models/location_person.dart';
import 'package:hopapp/src/provider/barProvider.dart';
import 'package:hopapp/src/provider/geoProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:geolocator/geolocator.dart';

import 'dart:math';

const randomMarkerNum = 100;

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  MapboxMapController? mapController;
  LocationPermission? permission;
  List<LocationPerson> localizacionesMarcadores = [];
  GeoProviders geoProv = new GeoProviders();
  BarProviders barProv = new BarProviders();
  GeoProviders geo = new GeoProviders();
  List<Uint8List> imageDataMarkers = [];
  Circle? circle;
  String? tempLat, tempLong;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position locationPosition = await _determinePosition();

    double lat = locationPosition.latitude.toDouble();
    double long = locationPosition.longitude.toDouble();

    mapController!.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 270.0,
          target: LatLng(lat, long),
          tilt: 30.0,
          zoom: 17.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    controller.addListener(() {});
    mapController!.onSymbolTapped.add((argument) {
      _onSymbolTapped(argument);
    });
  }

  void printMarker(List<GeoLocationData> informacion) {
    String ruta = '';
    String isHop = '';
    mapController!.clearSymbols();
    informacion.forEach((gpsinfo) => {
          if (int.parse(gpsinfo.amigos.toString()) <= 9)
            {ruta = 'markers_' + gpsinfo.amigos.toString() + '.png'}
          else
            {ruta = 'markers_9+.png'},
          if (gpsinfo.google == 'false')
            {isHop = 'assets/markers_google/'}
          else
            {isHop = 'assets/markers/'},
          mapController!.addSymbol(
              SymbolOptions(
                  geometry: LatLng(
                      double.parse(gpsinfo.lat!), double.parse(gpsinfo.lng!)),
                  iconImage: isHop + ruta),
              gpsinfo.toMap())
        });
  }

  void _onCameraIdleCallback() {
    _updateMarkerPosition();
  }

  void _updateMarkerPosition() async {
    String latitud = '';
    String longitud = '';
    double distancia = 0;
    List<GeoLocationData> decodeResp;

    latitud = mapController!.cameraPosition!.target.latitude.toString();
    longitud = mapController!.cameraPosition!.target.longitude.toString();

    /*print('------------');
    print('latitud ' + latitud);
    print('longitud ' + longitud);
    print('------------');*/

    if (tempLat == null && tempLong == null) {
      tempLat = latitud;
      tempLong = longitud;

      decodeResp = await geoProv.getGeoLocation(latitud, longitud);
      printMarker(decodeResp);
    } else {
      distancia = calculateDistance(
          double.parse(latitud),
          double.parse(longitud),
          double.parse(tempLat!),
          double.parse(tempLong!));

      if (distancia >= 10) {
        decodeResp = await geoProv.getGeoLocation(latitud, longitud);
        tempLat = latitud;
        tempLong = longitud;

        print('distancia  ' + distancia.toString() + '  si se busca');
        printMarker(decodeResp);
      } else {
        print('distancia  ' + distancia.toString() + '  no se busca');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String accessToken =
        'pk.eyJ1IjoiaG9wYXBwIiwiYSI6ImNrbjEyNzluczB0aWUybm56YWp0YmR3N2EifQ.zqa4xl3Ck8pkJxHRUWCIBA';

    final responsive = ResponsiveUtil(context);
    return Stack(
      children: [
        MapboxMap(
          accessToken: accessToken.toString(),
          onMapCreated: _onMapCreated,
          trackCameraPosition: true,
          onCameraIdle: _onCameraIdleCallback,
          initialCameraPosition: const CameraPosition(
              target: LatLng(14.661083, -90.478853), zoom: 10),
        ),
        Container(
            height: kToolbarHeight,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text(
                    'Find Friends At Any Venue',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleButtomCustom(
                    icon: Icons.person_add,
                    iconColor: Colors.grey,
                    function: () {},
                  ),
                ),
              ],
            )),
        // Positioned(
        //   top: 25,
        //   child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       child: buscadorControl(context)),
        // ),
        Positioned(
          right: 10,
          top: kToolbarHeight * 2.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              boton(() {
                getCurrentLocation();
              },
                  icono: Icons.navigation,
                  color: AppColors.gris.withOpacity(0.5)),
              SizedBox(height: 15),
              boton(() {
                _modalBottomSheetFavoritos(context);
              }, icono: Icons.vpn_key, color: AppColors.gris.withOpacity(0.5)),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  AppSettings.openLocationSettings();
                },
                child: new Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        blurRadius: 1,
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  child: Container(
                      child: Text('Fix Location Settings',
                          style: GoogleFonts.poppins(
                              color: Color.fromRGBO(86, 86, 86, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600))),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onSymbolTapped(Symbol symbol) {
    if (symbol.data!['google'] == 'true') {
      _modalBottomSheetInfoHop(context, symbol.data);
    } else {
      _modalBottomSheetInfoGoogle(context, symbol.data);
    }
  }

  void _modalBottomSheetInfoHop(
      BuildContext contextMaster, Map<dynamic, dynamic>? infoPoint) async {
    ProgressDialog dialog = ProgressDialog(contextMaster);
    dialog.show();
    Map<String, dynamic>? info =
        await barProv.infoBarData(int.parse('3').toString());
    dialog.dismiss();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        // var center = Center(
        //   child: infoBar.informationBarHop(
        //       contextMaster,
        //       3,
        //       infoPoint!['name'],
        //       info!['estableInfo']['url'],
        //       'friends here ' + infoPoint['amigos'],
        //       info['estableInfo']['line'],
        //       info['estableInfo']['cover'],
        //       info['estableInfo']['mesa'],
        //       info['estableInfo']['descuento'],
        //       info['estableInfo']['megusta'],
        //       infoPoint['lat'],
        //       infoPoint['lng']),
        // );

        var infoBarWidget = Container(
          width: 100,
          height: 100,
          color: Colors.red,
        );

        return Container(
          height: MediaQuery.of(context).size.height * 0.80,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
          ),
          child: infoBarWidget,
        );
      },
    );
  }

  void _modalBottomSheetInfoGoogle(
      BuildContext contextMaster, Map<dynamic, dynamic>? infoPoint) async {
    ProgressDialog dialog = ProgressDialog(contextMaster);
    dialog.show();
    Map<String, dynamic>? info =
        await barProv.infoBarData(int.parse('2').toString());
    dialog.dismiss();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        // var center = Center(
        //   child: infoBar.informationBarGoogle(
        //       contextMaster,
        //       3,
        //       infoPoint!['name'],
        //       info!['estableInfo']['url'],
        //       'friends here ' + infoPoint['amigos'],
        //       infoPoint['lat'],
        //       infoPoint['lng']),
        // );

        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.7,
          maxChildSize: 0.8,
          expand: true,
          builder: (_, controller) => Container(
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
            ),
            child: InfoBarButtomshet(
              infoPoint: infoPoint!,
              info: info!,
              controller: controller,
            ),
            // child: InfoBarGoogleButtomshet(
            //   infoPoint: infoPoint!,
            //   info: info!,
            //   controller: controller,
            // ),
          ),
        );
      },
    );
  }

  Widget boton(Function onPressed, {icono, color}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 25,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          icono,
          size: 28,
        ),
        color: color,
        onPressed: onPressed as void Function(),
      ),
    );
  }

  void _modalBottomSheetFavoritos(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
        backgroundColor: Color(0xffEDEEF0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: StatefulBuilder(builder: (BuildContext context, setState) {
              return new ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.00,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        margin: const EdgeInsets.only(
                            top: 6.0, right: 15.00, left: 15.00),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                          color: Color(0xffEDEEF0),
                        ),
                        child: FutureBuilder(
                          future: barProv.listMegusta(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<BarFavorite>> snapshot) {
                            if (snapshot.hasData) {
                              final bars = snapshot.data;

                              return ListView.builder(
                                itemCount: bars!.length,
                                itemBuilder: (context, i) =>
                                    _crearItem(bars[i], context, i),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ))
                  ],
                ),
              );
            }),
          );
        });
  }

  Widget _crearItem(BarFavorite bares, BuildContext context, int i) {
    return Container(
      constraints: BoxConstraints(minHeight: 85),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.only(left: 25.0, right: 25.0, top: 9.0, bottom: 9.0),
            leading: Container(
              height: 55.0,
              width: 55.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      bares.url!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xffA4A4A4),
                      offset: Offset(1.0, 5.0),
                      blurRadius: 3.0,
                    ),
                  ]),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(bares.nombre!,
                    style: GoogleFonts.poppins(
                        fontSize: 14.00,
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
                Text('5 friends here',
                    style: GoogleFonts.poppins(
                        fontSize: 13.00,
                        textStyle: TextStyle(color: AppColors.gris))),
              ],
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 40,
            ),
          )),
    );
  }

  Widget buscadorControl(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = ResponsiveUtil(context);
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: responsive.altoP(5.00),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 17,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.person,
                  size: 18,
                ),
                color: AppColors.primary,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x88999999),
                        offset: Offset(0, 5),
                        blurRadius: 5.0)
                  ],
                ),
                child: SizedBox(
                  height: 40,
                  width: size.width * 0.75,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                        right: 8,
                        top: 0,
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 50,
                                  width: 0.2,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.person_add_outlined,
                                    size: 18,
                                    color: AppColors.gris,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, 'addamigos');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 28.0),
                          child: Text(
                            'Search bars and friends...',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(color: AppColors.gris)),
                            maxLines: 1,
                          ))
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        )
      ]),
    );
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    int radiusEarth = 6371;
    double distanceKm;
    double distanceMts;
    double dlat, dlng;
    double a;
    double c;

    //Convertimos de grados a radianes
    lat1 = math.radians(lat1);
    lat2 = math.radians(lat2);
    lng1 = math.radians(lng1);
    lng2 = math.radians(lng2);
    // Fórmula del semiverseno
    dlat = lat2 - lat1;
    dlng = lng2 - lng1;
    a = sin(dlat / 2) * sin(dlat / 2) +
        cos(lat1) * cos(lat2) * (sin(dlng / 2)) * (sin(dlng / 2));
    c = 2 * atan2(sqrt(a), sqrt(1 - a));

    distanceKm = radiusEarth * c;
    distanceMts = 1000 * distanceKm;

    return distanceKm;
  }
}
