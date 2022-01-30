import 'package:flutter/material.dart';

class BuscadorMaps extends StatefulWidget {
  final String? miUbicacionText;

  BuscadorMaps({this.miUbicacionText});

  _BuscadorMapsState createState() => _BuscadorMapsState();
}

class _BuscadorMapsState extends State<BuscadorMaps> {
  // PlaceItemRes fromAddress;
  // PlaceItemRes toAddress;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[900],
          radius: 17,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.person,
              size: 18,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x88999999),
                  offset: Offset(0, 5),
                  blurRadius: 5.0)
            ],
          ),
          child: SizedBox(
            height: 40,
            width: size.width * 0.65,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: <Widget>[
                Positioned(
                  right: 8,
                  top: 0,
                  width: 40,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            width: 0.2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.person_add_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 28.0),
                    child: Text(
                      widget.miUbicacionText!,
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
