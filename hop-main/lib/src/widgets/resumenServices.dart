import 'package:flutter/material.dart';

class ResumenServices extends StatelessWidget {
  final nombre;
  final user;
  final urlFoto;
  final tipoIcon;
  const ResumenServices(
      {Key? key,
      required this.nombre,
      required this.user,
      required this.urlFoto,
      required this.tipoIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: []),
      width: double.infinity,
      child: ListTile(
          leading: CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(
                "https://www.partesdel.com/wp-content/uploads/partes-de-un-bar...jpg"),
          ),
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
                  color: Colors.grey,
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
