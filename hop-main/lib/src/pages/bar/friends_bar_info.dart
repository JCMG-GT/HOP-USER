import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

class BarFriendsInfo extends StatelessWidget {
  const BarFriendsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0).copyWith(
        bottom: 30.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Firends',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FirendTile(name: 'Joseph Martin'),
          Divider(),
          FirendTile(name: 'Jessica Wilson'),
          Divider(),
          FirendTile(name: 'Charles Thomas'),
          Divider(),
          FirendTile(name: 'Margaret Taylor'),
          Divider(),
          FirendTile(name: 'Linda Lopez'),
        ],
      ),
    );
  }
}
