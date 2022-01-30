import 'package:flutter/material.dart';

import 'package:hopapp/src/pages/profile/widgets/widget_profile.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/utils/responsive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  SizedBox(height: responsive.altoP(10)),
                  UserImage(
                      urlImg:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRft9j1N5RomI96p0vldhtRrYqpXbyGuvBWQw&usqp=CAU'),
                  SizedBox(height: responsive.altoP(3)),
                  Center(
                    child: Text(
                      // nombreUser(),
                      'User',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.00,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: responsive.altoP(3)),
                  ItemsOptions(
                    responsive: responsive,
                  ),
                  TextOptions()
                ],
              ),
            ),
            CustomCloseButton(responsive: responsive),
          ],
        ),
      ),
    );
  }
}
