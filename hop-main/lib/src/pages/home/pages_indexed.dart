import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/cubit/home_navigation/home_navigation_cubit.dart';

import 'package:hopapp/src/pages/home/tab_discover/tab_discover.dart';
import 'package:hopapp/src/pages/home/tab_map/maps_sample.dart';
import 'package:hopapp/src/pages/home/tab_qr/tab_qr.dart';

/// Widget que almacenas las diferentes pantallas, que se muestrar tras la
/// seleccion de la opcion en el ButtonNavigationBar
/// Se usa un [IndexedStack] para tener ya dibujadas las pantallas y sobre
/// todo para mantener su estado de cada una de ellas, evitando que se redibujen
class PagesIndexed extends StatelessWidget {
  const PagesIndexed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList;
    pageList = [
      MapSample(),
      TabDiscover(),
      TabQR(),
      // (),
    ];

    return BlocBuilder<HomeNavigationCubit, AppTab>(
      builder: (context, activeTab) {
        return IndexedStack(
          index: AppTab.values.indexOf(activeTab),
          children: pageList,
        );
      },
    );
  }
}
