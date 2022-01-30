import 'package:flutter/material.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/parameterClass/TransacModel.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  @override
  _QrGeneratorPageState createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGenerator> {
  @override
  Widget build(BuildContext context) {
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
    final TransacBar args = ModalRoute.of(context)!.settings.arguments as TransacBar;
    final responsive = ResponsiveUtil(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          utils.headerFinalPantalla(context, "", Colors.black, "home"),
          Container(
              padding: EdgeInsets.only(left: 28.00),
              child: Column(
                children: [
                  Text(
                    "Cover",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.00, color: Colors.black),
                  ),
                  SizedBox(
                    height: responsive.altoP(1.00),
                  ),
                  Text(
                    args.nombreBar,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.00,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsive.altoP(4.00),
                  ),
                  QrImage(
                    data: args.idTrans.toString(),
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                  SizedBox(
                    height: responsive.altoP(6.00),
                  ),
                  _botonIngreso(context),
                  SizedBox(
                    height: responsive.altoP(7.00),
                  ),
                  Image.asset(
                    "assets/qr/apple-wallet.png",
                    width: responsive.anchoP(40.00),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

Widget _botonIngreso(BuildContext context) {
  return Container(
    height: 50.0,
    child: RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "home");
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
          child: Text("Access later",
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
