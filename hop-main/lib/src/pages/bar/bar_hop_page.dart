import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/logic/bloc/bar/bar_info_bloc.dart';
import 'package:hopapp/src/pages/bar/bar_info.dart';
import 'package:hopapp/src/pages/bar/friends_bar_info.dart';
import 'package:hopapp/src/pages/widgets/animated_icon_custom.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/utils/responsive.dart';

class BarHop extends StatelessWidget {
  const BarHop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return BlocProvider(
      create: (context) => BarInfoBloc(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: responsive.altoP(4.0),
                  horizontal: responsive.anchoP(7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBarCustom(
                    title: 'Hop Venues',
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    height: 5.0,
                    color: AppColors.primary,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BarInfoBox(
                          name: 'Carpenter\'s Bar',
                          imagePath:
                              'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                          address: '630 Oxford rd, Ann Arbor, Mi',
                          schedule: 'Today, 2:00pm - 2:00am',
                        ),
                      ),
                      AnimateIconCustom()
                    ],
                  ),
                  OptionTabs(
                    friendsNumber: '10',
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
            ),
          ),
        ),
      ),
    );
  }
}
