import 'package:flutter/material.dart';
import 'package:hopapp/src/models/addCard.dart';
import 'package:hopapp/src/provider/paymentProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

// import 'package:flutter_masked_text/flutter_masked_text.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<Payment> {
  CardPaymentModel cardModel = new CardPaymentModel();
  var controllerCard = new MaskedTextController(mask: '0000-0000-0000-0000');
  var controllerExpiration = new MaskedTextController(mask: '00/0000');
  var controllerCVV = new MaskedTextController(mask: '000');
  PaymentProvider payProv = new PaymentProvider();
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
                  "Skip",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color.fromRGBO(159, 169, 186, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: responsive.altoP(4.00),
              ),
              Text(
                "Add Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.00),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: responsive.altoP(1.00),
              ),
              Text(
                "For in - app purchases.",
                style: TextStyle(fontSize: 16.00),
                textAlign: TextAlign.left,
              ),
              Form(
                key: formKeyCard,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: responsive.altoP(5)),
                      _crearName(),
                      SizedBox(height: responsive.altoP(2)),
                      _crearCard(),
                      SizedBox(
                        height: responsive.altoP(2.00),
                      ),
                      Row(
                        children: [
                          Container(
                            width: responsive.anchoP(40.00),
                            child: _crearExpiration(),
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                          Container(
                            width: responsive.anchoP(40.00),
                            child: _crearCVV(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: responsive.altoP(25.00),
                      ),
                      _botonIngreso(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }

  Widget _crearName() {
    return TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: "Name on",
          hintText: "Enter name on card",
        ),
        onSaved: (value) => cardModel.name = value);
  }

  Widget _crearExpiration() {
    return TextFormField(
        controller: controllerExpiration,
        keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: "Expiration Date",
          hintText: "Enter Expiration Date",
        ),
        onSaved: (value) => cardModel.expiration = value);
  }

  Widget _crearCVV() {
    return TextFormField(
        controller: controllerCVV,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "CVV",
          hintText: "Enter CVV",
        ),
        onSaved: (value) => cardModel.cvv = value);
  }

  Widget _crearCard() {
    return TextFormField(
        controller: controllerCard,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Card",
          hintText: "Enter number card",
        ),
        onSaved: (value) => cardModel.card = value);
  }

  Widget _botonIngreso() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          _addCardPayment();
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
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text("Next",
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

  _addCardPayment() async {
    if (!formKeyCard.currentState!.validate()) return;
    formKeyCard.currentState!.save();

    if (cardModel.name.toString().trim().length == 0) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "The name is not valid.");
      return;
    }

    if (utils.validateCreditCard(cardModel.card!)) {
      utils.alertValidation(context, AlertType.warning, "HOP",
          "The credit / debit card number is not valid.");
      return;
    }

    if (int.parse(cardModel.cvv!).toString().length != 3) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "The CVV is not valid.");
      return;
    }

    Map info = await payProv.grabarTarjeta(cardModel);

    if (info["estado"] == true) {
      utils.alertValidationRoute(context, AlertType.success, "HOP",
          "Your card has been added successfully", "home");
    } else {
      utils.alertValidation(context, AlertType.success, "HOP",
          "An error has occurred, verify the information entered");
    }
  }
}
