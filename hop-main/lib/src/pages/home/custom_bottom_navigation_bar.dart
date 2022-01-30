import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/cubit/home_navigation/home_navigation_cubit.dart';

import 'package:hopapp/src/utils/responsive.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = ResponsiveUtil(context);

    return BlocBuilder<HomeNavigationCubit, AppTab>(
      builder: (context, activeTab) {
        return BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(activeTab),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: responsive.altoP(4),
          enableFeedback: false,
          showSelectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: '',
              tooltip: 'Map',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore),
              label: '',
              tooltip: 'Venues',
            ),
            const BottomNavigationBarItem(
              tooltip: 'QR',
              icon: Icon(Icons.qr_code),
              label: '',
            ),
          ],
          onTap: (i) {
            context.read<HomeNavigationCubit>().onChangeTab(AppTab.values[i]);
          },
        );
      },
    );
  }
}
