import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/logic/bloc/bar/bar_info_bloc.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

class InfoBarGoogleButtomshet extends StatelessWidget {
  const InfoBarGoogleButtomshet({
    required this.infoPoint,
    required this.info,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final Map<dynamic, dynamic> infoPoint;
  final Map<String, dynamic> info;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final cond = false;
    return BlocProvider(
      create: (context) => BarInfoBloc(),
      child: ListView(
        padding: const EdgeInsets.all(18.0),
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: <Widget>[
          // Info General Bar
          Container(
            width: double.infinity,
            child: BarInfoBox(
              imagePath: info['estableInfo']['url'],
              name: infoPoint['name'],
              address: '630 Oxford rd, Ann Arbor, Mi',
              schedule: info['estableInfo']['horario'],
            ),
          ),
          Divider(),
          if (cond)
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Colors.black),
              child: Text(
                'Tap to',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          if (cond)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Let Gramps know you want them to join the Hop Community',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          if (cond) Divider(),
          if (!cond)
            _FriendsInfo(
              friends: [],
            ),
        ],
      ),
    );
  }
}

class _FriendsInfo extends StatelessWidget {
  const _FriendsInfo({
    Key? key,
    required this.friends,
  }) : super(key: key);

  final List friends;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Column(children: <Widget>[
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
          friends.isNotEmpty
              ? Column(
                  children: [
                    FirendTile(name: 'Tyler Roberts'),
                    Divider(),
                    FirendTile(name: 'Joseph Martin'),
                    Divider(),
                    FirendTile(name: 'Jessica Wilson'),
                    Divider(),
                    FirendTile(name: 'Charles Thomas'),
                    Divider(),
                    FirendTile(name: 'Margaret Taylor'),
                    Divider(),
                    FirendTile(name: 'Linda Lopez'),
                    Divider(),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Text(
                      'You have no friends ... here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '+ Add Friends',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                )
        ]));
  }
}
