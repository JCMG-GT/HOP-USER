import 'package:flutter/material.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:location/location.dart';

class Permisos extends StatefulWidget {
  @override
  _PermisosPageState createState() => _PermisosPageState();
}

class _PermisosPageState extends State<Permisos> {
  Location location = new Location();
  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  bool a0 = false,
      a1 = false,
      a2 = false,
      a3 = false,
      a4 = false,
      a5 = false,
      a6 = false,
      a7 = false,
      a8 = false,
      a9 = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: responsive.altoP(2)),
            GestureDetector(
              child: Text(
                "Skip",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Color.fromRGBO(159, 169, 186, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, "Payment");
              },
            ),
            SizedBox(height: responsive.altoP(2)),
            Text(
              "Update Location ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            SizedBox(height: responsive.altoP(1)),
            Text(
              "Settings",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            SizedBox(height: responsive.altoP(1)),
            Text(
              "Choose “Always” so we can help you meet up with friends in real life.",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: responsive.altoP(3),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 239, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                height: responsive.altoP(5),
                child: Row(
                  children: [
                    Text(
                      "   ALLOW LOCATION ACCESS",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
            Expanded(
              child: ListView(children: [
                new ListTile(
                  title: Text('Never'),
                  onTap: () {
                    Navigator.pushNamed(context, "Payment");
                  },
                ),
                new ListTile(
                  title: Text('Ask Next Time'),
                  onTap: () {
                    setState(() {
                      a4 = true;
                      requestPermissions();
                    });
                  },
                ),
                new ListTile(
                  title: Text('Wjile Using the App'),
                  onTap: () {
                    setState(() {
                      a4 = true;
                      requestPermissions();
                    });
                  },
                ),
                new ListTile(
                  title: Text('Always'),
                  onTap: () {
                    setState(() {
                      a4 = true;
                      requestPermissions();
                    });
                  },
                )
              ]),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 239, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                height: responsive.altoP(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "App explanation: 'Tap Always Allow' for the best experience. Your location will only be shown to friends you choose. We use your location to let you know when friends are nearby and helpyou meet up",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: responsive.altoP(4),
            ),
            _botonSiguiente(),
            Expanded(child: Container()),
          ],
        )),
      )),
    );
  }

  Widget _botonSiguiente() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, "Payment");
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 86, 39, 158),
                  Color.fromARGB(255, 31, 108, 255),
                  Color.fromARGB(255, 31, 108, 255)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text("Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.00)),
          ),
        ),
      ),
    );
  }

  requestPermissions() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }
}
