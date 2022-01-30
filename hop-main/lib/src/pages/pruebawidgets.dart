/*import 'package:flutter/material.dart';
import 'package:hopapp/src/widgets/botoncongradiente.dart';
import 'package:hopapp/src/widgets/cardfriends.dart';
import 'package:hopapp/src/widgets/tablaPrecios.dart';
import 'package:hopapp/src/widgets/tarjetaamigos.dart';

class PruebaWid extends StatelessWidget {
  const PruebaWid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              TarjetaAmigos(
                nombreNegocio: 'MO Bar & Lounge',
                urlImagen:
                    'https://d22uy85tnpcynx.cloudfront.net/2019/07/Feria-emprendedores-1024x682.jpg',
                icono: Icons.favorite,
                nAmigos: '18',
              ),
              SizedBox(
                height: 20,
              ),
              TablaPrecios(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  //alignment: Alignment.topLeft,
                  'Friends',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
              ),
              promocion('20'),
              CardAmigo(),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogos(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              // height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  "Ghost Mode",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "You are now invisible for the next 24 Hours",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: RaisedGradientButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff5329ac),
                          Color(0xff3158df),
                        ],
                      ),
                      onPressed: () {
                        print('button clicked');
                      }),
                ),
              ])),
        );
      },
    );
  }

  //Promocion 20%

  Widget promocion(dynamic desc) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: []),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Text(
        desc + '\% OFF Fridat 9pm-11pm',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
      ),
    );
  }
}
*/
