import 'package:flutter/material.dart';

class CardAddPromociones extends StatelessWidget {
  final nombrebar;
  final descripbar;
  final urlFotobar;

  const CardAddPromociones(
      {Key? key,
      required this.nombrebar,
      required this.descripbar,
      required this.urlFotobar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: []),
        // height: 60,
        width: double.infinity,
        child: ListTile(
          leading: Container(
            width: 70,
            margin: EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(urlFotobar),
              ),
            ),
          ),
          title: Text(
            nombrebar,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          subtitle: Text(descripbar),
        ));
  }
}
