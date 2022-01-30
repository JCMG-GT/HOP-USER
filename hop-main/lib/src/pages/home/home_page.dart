import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/cubit/home_navigation/home_navigation_cubit.dart';

import 'package:hopapp/src/pages/home/custom_bottom_navigation_bar.dart';
import 'package:hopapp/src/pages/home/pages_indexed.dart';

import 'package:hopapp/src/utils/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = ResponsiveUtil(context);

    var borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(40),
      bottomRight: Radius.circular(40),
    );

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: BlocProvider(
        create: (context) => HomeNavigationCubit(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(85, 41, 161, 1),
                Color.fromRGBO(57, 74, 207, 1),
                Color.fromRGBO(45, 91, 230, 1),
                Color.fromRGBO(38, 99, 242, 1),
                Color.fromRGBO(31, 108, 249, 1),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                child: Stack(
                  // fit: StackFit.loose,
                  children: [
                    Container(
                      width: responsive.width,
                      height: responsive.altoP(90),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                      ),
                      child: ClipRRect(
                        borderRadius: borderRadius,
                        child: const PagesIndexed(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: const CustomBottomNavigationBar(),
          ),
        ),
      ),
    );
  }
}
