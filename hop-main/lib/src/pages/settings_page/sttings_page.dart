import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/routes/routes.dart';

import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomCloseButton(responsive: responsive),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _ButtonSetting(
                      responsive: responsive,
                      function: () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                      iconData: Icons.settings,
                    ),
                    SizedBox(width: responsive.anchoP(10)),
                    _ButtonSetting(
                      responsive: responsive,
                      function: () {
                        Navigator.pushNamed(context, AppRoutes.payment);
                      },
                      iconData: Icons.payment,
                    )
                  ],
                ),
                SizedBox(height: responsive.anchoP(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _ButtonSetting(
                      responsive: responsive,
                      function: () {
                        Navigator.pushNamed(context, AppRoutes.firends);
                      },
                      iconData: Icons.person_add,
                    ),
                    SizedBox(width: responsive.anchoP(10)),
                    _ButtonSetting(
                      responsive: responsive,
                      function: () {
                        utils.showAlert(
                          context: context,
                          title: 'Ghost Mode',
                          description:
                              'You are now invisible for the next 24 hours.',
                        );
                      },
                      iconData: Icons.supervised_user_circle_sharp,
                      image: AssetImage('assets/menu_options/ghost.png'),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonSetting extends StatelessWidget {
  const _ButtonSetting({
    Key? key,
    required this.responsive,
    required this.function,
    required this.iconData,
    this.image,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final Function function;
  final IconData iconData;
  final AssetImage? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.altoP(10),
      width: responsive.altoP(10),
      child: ElevatedButton(
        onPressed: () => function(),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
        ),
        child: Ink(
          padding: EdgeInsets.all(responsive.altoP(2)),
          decoration: BoxDecoration(
            image: image != null
                ? DecorationImage(
                    image: AssetImage('assets/menu_options/ghost.png'),
                  )
                : null,
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 31, 108, 255),
                Color.fromARGB(255, 31, 108, 255),
                Color.fromARGB(255, 86, 39, 158),
              ],
            ),
          ),
          child: image == null
              ? Icon(
                  iconData,
                  size: responsive.altoP(6),
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
