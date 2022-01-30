import 'package:flutter/material.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/pages/friends/tab_request.dart';
import 'package:hopapp/src/pages/home/tab_discover/widgets/widgets_tab_discover.dart';

import 'package:hopapp/src/utils/responsive.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomCloseButton(responsive: responsive),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.anchoP(6)),
                      child: BarTitle(
                        nameBar: 'Add Friends',
                        key: Key('key_friends_page'),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                floating: false,
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: Colors.black,
                    indicatorColor: AppColors.primary,
                    // unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: <Widget>[
                      Tab(
                          icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Request"),
                          Container(
                            height: 8.0,
                            width: 8.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary),
                          )
                        ],
                      )),
                      Tab(icon: Text("Frinds")),
                      Tab(icon: Text("Contacts")),
                    ],
                  ),
                  EdgeInsets.symmetric(horizontal: responsive.anchoP(6)),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              TabRequest(),
              TabRequest(),
              TabRequest(),
            ],
          ),
        ),
      )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar, this._padding);

  final TabBar _tabBar;
  final EdgeInsetsGeometry _padding;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ThemeData.light().scaffoldBackgroundColor,
      padding: _padding,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
