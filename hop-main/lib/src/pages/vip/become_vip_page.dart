import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/bloc/vip/vip_bloc.dart';
import 'package:hopapp/src/pages/vip/vip_content_layout.dart';
import 'package:hopapp/src/pages/vip/novip_content_layour.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/utils/responsive.dart';

class BecomeVip extends StatelessWidget {
  const BecomeVip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VipBloc()..add(LoadVip()),
          child: BlocBuilder<VipBloc, VipState>(
            builder: (context, state) {
              if (state is VipLoading) {
                return LoadingIndicator();
              } else if (state is VipRequired) {
                return NoVipContent(
                  responsive: responsive,
                  nameBar: state.name!,
                  featuresVip: state.featuresVip!,
                  costVip: state.costVip!,
                );
              } else if (state is VipGaranted) {
                var currentTime =
                    '${state.startDate!.year}/${state.startDate!.month}/${state.startDate!.day}';
                return VipContent(
                  responsive: responsive,
                  nameBar: state.name! + ' VIP',
                  featuresVip: state.featuresVip!,
                  costVip: state.costVip!,
                  startDate: "$currentTime",
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
