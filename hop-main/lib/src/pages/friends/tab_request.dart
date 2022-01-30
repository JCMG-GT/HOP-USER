import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hopapp/src/logic/cubit/firends_request_list/child_cound_list_cubit.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/utils/responsive.dart';

import 'widgets/widgets_friends.dart';

class TabRequest extends StatelessWidget {
  const TabRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var freinds = [
      {'name': 'John Harris', 'nick': 'Jhewh94'},
      {'name': 'Emyly Lewis', 'nick': 'Emm01'},
      {'name': 'John Harris', 'nick': 'Jhewh94'},
      {'name': 'John Harris', 'nick': 'Jhewh94'},
      {'name': 'John Harris', 'nick': 'Jhewh94'},
    ];

    final responsive = ResponsiveUtil(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FriendsListRequestCubit(freinds.length),
          key: Key('cubit_request'),
        ),
        BlocProvider(
          create: (context) => FriendsListQuickCubit(freinds.length),
          key: Key('cubit_quick'),
        ),
      ],
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          // physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: responsive.altoP(2.0)),
            ),
            BlocBuilder<FriendsListRequestCubit, int>(
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return FriendRequestTile(
                        name: freinds[index]['name'].toString(),
                        nickName: freinds[index]['nick'].toString(),
                      );
                    },
                    childCount: state,
                  ),
                );
              },
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Divider(),
                BlocBuilder<FriendsListRequestCubit, int>(
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          context.read<FriendsListRequestCubit>().onSelect();
                        },
                        child: Text(
                          state <= 2 ? 'View More' : 'View Less',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ));
                  },
                ),
                SizedBox(height: responsive.altoP(2)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: responsive.anchoP(6)),
                  child: BarTitle(
                    nameBar: "Quick Add",
                  ),
                ),
                SizedBox(height: responsive.altoP(1)),
              ],
            )),
            BlocBuilder<FriendsListQuickCubit, int>(
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print(index);
                      return FriendRequestTile(
                        name: freinds[index]['name'].toString(),
                        nickName: freinds[index]['nick'].toString(),
                      );
                    },
                    childCount: state,
                  ),
                );
              },
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Divider(),
                  BlocBuilder<FriendsListQuickCubit, int>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context.read<FriendsListQuickCubit>().onSelect();
                          },
                          child: Text(
                            state <= 2 ? 'View More' : 'View Less',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
