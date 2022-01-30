import 'package:flutter/material.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPayment extends StatefulWidget {
  @override
  State<QrPayment> createState() => QrPaymentState();
}

class QrPaymentState extends State<QrPayment> {
  @override
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: responsive.anchoP(8),
                    ),
                    Row(
                      children: [
                        InkWell(
                          // this is the one you are looking for..........
                          onTap: () {
                            Navigator.popAndPushNamed(context, 'QrInformation');
                          },
                          child: new Container(
                            width: 35.0,
                            height: 35.0,
                            //padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.2),
                                  blurRadius: 1,
                                  offset: Offset(0.5, 0.5), // Shadow position
                                ),
                              ],
                            ),
                            child: Container(
                              child: Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          // this is the one you are looking for..........
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: new Container(
                            width: 35.0,
                            height: 35.0,
                            //padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.2),
                                  blurRadius: 1,
                                  offset: Offset(0.5, 0.5), // Shadow position
                                ),
                              ],
                            ),
                            child: Container(
                              child: Icon(
                                Icons.clear_outlined,
                                size: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.altoP(15)),
                    QrImage(
                      data: generateRandom(),
                      foregroundColor: Colors.indigoAccent,
                      version: QrVersions.auto,
                      backgroundColor: Colors.white,
                      embeddedImage: Image.asset('assets/icons/hop.png').image,
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(100, 125)),
                      size: 300.0,
                      gapless: false,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    _botonClose(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

String generateRandom() {
  var valor = 0;
  return valor.toString();
}

Widget _botonClose(BuildContext context) {
  return Container(
    height: 50.0,
    child: RaisedButton(
      onPressed: () {
        Navigator.pop(context);
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
          child: Text("Close",
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
