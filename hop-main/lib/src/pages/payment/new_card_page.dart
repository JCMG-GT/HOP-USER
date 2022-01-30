import 'package:flutter/material.dart';

import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/models/addCard.dart';

import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/utils/responsive.dart';

class NewCardPage extends StatelessWidget {
  NewCardPage({Key? key}) : super(key: key) {
    var controllerCard = MaskedTextController(mask: '0000-0000-0000-0000');
    var controllerExpiration = MaskedTextController(mask: '00/0000');
    var controllerCVV = MaskedTextController(mask: '000');
  }

  final formKeyCard = GlobalKey<FormState>();
  CardPaymentModel cardModel = CardPaymentModel();

  var controllerCard;
  var controllerExpiration;
  var controllerCVV;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomCloseButton(
                responsive: responsive,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: responsive.anchoP(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BarTitle(
                        nameBar: 'New Card', key: Key('key_new_card_page')),
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
                            SizedBox(height: responsive.altoP(25.00)),
                            // _botonIngreso(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: CustomButton(
                onPressed: () {},
                title: 'Add card',
                gradient: false,
                colorPrimary: AppColors.primary,
              )),
              SizedBox(height: responsive.altoP(5.00)),
            ],
          ),
        ),
      ),
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
        // controller: controllerExpiration,
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
}
