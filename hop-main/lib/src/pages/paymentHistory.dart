import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/provider/providerCarduser.dart';
import 'package:hopapp/src/services/cardUserModel.dart';
import 'package:hopapp/src/services/historyPayment.dart';

import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/widgets/paymentCard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hopapp/src/widgets/paymentHistory.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

CardUserProvider carUser = new CardUserProvider();
final _prefs = new PreferenciasUsuario();

class _PaymentHistoryPageState extends State<PaymentHistory> {
  final formKeyCard = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Container(
          alignment: Alignment(0.0, 0.0),
          margin: new EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: responsive.altoP(2)),
              GestureDetector(
                child: Text(
                  "X",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "home");
                },
              ),
              SizedBox(
                height: responsive.altoP(2.00),
              ),
              Text(
                "Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.00),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: responsive.altoP(1.00),
              ),
              SizedBox(
                height: responsive.altoP(2.00),
              ),
              pageCard(_prefs.id),
              SizedBox(
                height: responsive.altoP(2.00),
              ),
              GestureDetector(
                child: Text(
                  "+ Add a card",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.00,
                    color: Color.fromRGBO(1, 116, 247, 1),
                  ),
                ),
                onTap: () => {Navigator.pushNamed(context, "Payment")},
              ),
              SizedBox(
                height: responsive.altoP(6.00),
              ),
              Text(
                "Payment History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29.00),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: responsive.altoP(1.00),
              ),
              pageHistory(_prefs.id),
            ],
          ),
        ),
      ))),
    );
  }

  Widget pageCard(String tipo, {bool valor = true}) {
    return FutureBuilder(
        future: carUser.cardUser(tipo),
        builder:
            (BuildContext context, AsyncSnapshot<List<TarjetaUs>> snapshot) {
          if (snapshot.hasData) {
            final resumeServ = snapshot.data!;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: resumeServ.length,
              itemBuilder: (context, i) {
                return PaymentCards(
                  nombre: resumeServ[i].notarjeta,
                  urlFoto:
                      'https://cdn4.iconfinder.com/data/icons/online-payment-methods-03/128/visa_payment_methods-512.png',
                  tipoIcon: valor,
                );
              },
            );
          } else {
            return Center(child: SpinKitFadingCube(color: Colors.indigo[700]));
          }
        });
  }

  Widget pageHistory(String tipo, {bool valor = true}) {
    return FutureBuilder(
        future: carUser.historialCompra(tipo),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistCompra>> snapshot) {
          if (snapshot.hasData) {
            final resumeServ = snapshot.data!;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: resumeServ.length,
              itemBuilder: (context, i) {
                return PaymentHistoryCard(
                  nombrebar: resumeServ[i].nombre,
                  nombreprod: resumeServ[i].compra,
                  precio: resumeServ[i].precio,
                );
              },
            );
          } else {
            return Center(child: SpinKitFadingCube(color: Colors.indigo[700]));
          }
        });
  }
}
