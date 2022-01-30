import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/bloc/dicover/discover_bloc.dart';

import 'package:hopapp/src/pages/home/tab_discover/subtab_freinds.dart';
import 'package:hopapp/src/pages/home/tab_discover/subtab_promos.dart';
import 'package:hopapp/src/pages/home/tab_discover/subtab_venues.dart';

import 'package:hopapp/src/pages/home/tab_discover/widgets/widgets_tab_discover.dart';

import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/config/app_colors.dart';

class TabDiscover extends StatelessWidget {
  const TabDiscover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = ResponsiveUtil(context);

    return BlocProvider(
      create: (context) => DiscoverBloc(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.grey[300]!,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.5]),
        ),
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        TitleWidget(),
                        SearchBar(responsive: responsive),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: SliverAppBarDelegate(TabBar(
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelColor: Colors.black,
                      automaticIndicatorColorAdjustment: true,
                      indicatorColor: AppColors.primary,
                      unselectedLabelColor: Colors.black,
                      // indicator: BoxDecoration(
                      //     color: AppColors.primary, shape: BoxShape.rectangle),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: <Widget>[
                        Tab(icon: Text("Venues")),
                        Tab(icon: Text("Promos")),
                        Tab(icon: Text("Friends")),
                      ])),
                ),
              ];
            },
            body: Container(
              color: Colors.white,
              child: BlocBuilder<DiscoverBloc, DiscoverState>(
                builder: (context, state) {
                  if (state.loading!)
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  else
                    return TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        SubtabVenues(),
                        SubtabPromos(),
                        SubtabFriends(),
                      ],
                    );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
          child: Center(
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
