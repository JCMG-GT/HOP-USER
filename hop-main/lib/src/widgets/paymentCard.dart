import 'package:flutter/material.dart';

class PaymentCards extends StatelessWidget {
  final nombre;
  final urlFoto;
  final tipoIcon;

  const PaymentCards(
      {Key? key,
      required this.nombre,
      required this.urlFoto,
      required this.tipoIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      width: double.infinity,
      child: ListTile(
          leading: Image.network(urlFoto),
          title: Text(
            nombre,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          trailing: tipoIcon
              ? Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                )
              : invite()),
    );
  }

  Widget invite() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: []),
      child: Text(
        'INVITE',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
