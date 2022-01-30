import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/info_bar/info_bloc.dart';
import 'package:hopapp/src/parameterClass/TransacModel.dart';
import 'package:hopapp/src/parameterClass/informationBarModel.dart';
import 'package:hopapp/src/provider/barProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:hopapp/src/utils/utils.dart';
import 'package:provider/provider.dart';

class InfoBar extends StatefulWidget {
  InfoBar._();

  static ChangeNotifierProvider init() => ChangeNotifierProvider<InfoBloc>(
        create: (_) => InfoBloc(),
        builder: (_, __) => new InfoBar._(),
      );

  @override
  _InfoBarPageState createState() => _InfoBarPageState();
}

class _InfoBarPageState extends State<InfoBar> {
  bool? _isInitialized; //This is the key
  late var appBloc;

  Future showInfo() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      appBloc.info();
    });
  }

  @override
  void initState() {
    super.initState();
    showInfo();
  }

  @override
  Widget build(BuildContext context) {
    appBloc = context.watch<InfoBloc>();
    if (this._isInitialized == null || !this._isInitialized!) {
      // Only execute once
      appBloc.load(context);
      // appHome.cargarParametrosGenerales();
      this._isInitialized =
          true; // Set this to true to prevent next execution using "if()" at this root block
    }
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        SingleChildScrollView(child: formProfile())
      ],
    )));
  }

  Widget formProfile() {
    final InfoBarArgModel args =
        ModalRoute.of(context)!.settings.arguments as InfoBarArgModel;
    final responsive = ResponsiveUtil(context);

    return Container(
      padding: EdgeInsets.only(left: responsive.anchoP(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          utils.headerPantalla(context, "", Colors.black, "/"),
          Container(
              padding: EdgeInsets.only(left: 10.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.nombre,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30.00,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsive.altoP(6.00),
                  ),
                  Text(
                    "\$" + args.precio + " /month",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20.00,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsive.altoP(8.00),
                  ),
                  Text(
                    "What you'll get:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.00,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsive.altoP(2.00),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: appBloc.favorites.length,
                      itemBuilder: (context, i) {
                        return itemDescription(appBloc.favorites[i]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _botonIngreso(context, int.parse(args.id), "VIP",
                      double.parse(args.precio)),
                  SizedBox(
                    height: responsive.altoP(7.00),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget itemDescription(String? descripcion) {
    final responsive = ResponsiveUtil(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.blue,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          SizedBox(
            width: responsive.altoP(2),
          ),
          Text(
            "$descripcion",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.00),
          ),
        ],
      ),
    );
  }
}

void makePay(BuildContext context, int idBar, String desc, double price) async {
  showDialogConfirm(context, "Confirm Payment",
      "Are you sure you want to make this payment of $price ", () async {
    Navigator.of(context).pop();
    BarProviders barProv = new BarProviders();
    ProgressDialog dialog = ProgressDialog(context);
    dialog.show();
    Map<String, dynamic>? info = await barProv.cobroBar(idBar, desc, price);
    dialog.dismiss();
    Navigator.pop(context);
    Navigator.pushNamed(context, "QRGenerator",
        arguments: TransacBar(
            int.parse(info!["usCompra"]["idtran"]), "Bar de Prueba"));
  });
}

Widget _botonIngreso(
    BuildContext context, int idBar, String desc, double price) {
  return Container(
    height: 50.0,
    child: RaisedButton(
      onPressed: () {
        makePay(context, idBar, desc, price);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text("Become VIP",
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
