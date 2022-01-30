import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/bloc/bar/bar_info_bloc.dart';
import 'package:hopapp/src/pages/bar/bar_info.dart';
import 'package:hopapp/src/pages/bar/friends_bar_info.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

class InfoBarButtomshet extends StatelessWidget {
  const InfoBarButtomshet({
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
    return BlocProvider(
      create: (context) => BarInfoBloc(),
      child: ListView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: <Widget>[
          // Info General Bar
          _BarGeneralInfo(info: info, infoPoint: infoPoint),

          OptionTabs(
            friendsNumber: info['estableInfo']['friends'].toString().trim()[0],
          ),
          Divider(),
          BlocBuilder<BarInfoBloc, BarInfoState>(
            builder: (context, state) {
              return state.infoTab ? BarInfo() : BarFriendsInfo();
              /////
            },
          ),
        ],
      ),
    );
  }
}

class _BarGeneralInfo extends StatelessWidget {
  const _BarGeneralInfo({
    Key? key,
    required this.info,
    required this.infoPoint,
  }) : super(key: key);

  final Map<String, dynamic> info;
  final Map infoPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0).copyWith(bottom: 0.0),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: BarInfoBox(
              imagePath: info['estableInfo']['url'],
              name: infoPoint['name'],
              address: '630 Oxford rd, Ann Arbor, Mi',
              schedule: info['estableInfo']['horario'],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 30.0,
            ),
          )
        ],
      ),
    );
  }
}
