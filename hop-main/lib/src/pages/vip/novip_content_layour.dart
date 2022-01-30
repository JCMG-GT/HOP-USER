import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/bloc/vip/vip_bloc.dart';
import 'package:hopapp/src/pages/vip/widgets/widgets_vip.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;

class NoVipContent extends StatelessWidget {
  const NoVipContent({
    Key? key,
    required this.responsive,
    required this.nameBar,
    required this.costVip,
    required this.featuresVip,
  }) : super(key: key);

  final ResponsiveUtil responsive;

  final String nameBar, costVip;
  final List<String> featuresVip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.anchoP(7),
            ),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBarColumn(responsive: responsive, title: nameBar),
                Container(
                  margin: EdgeInsets.symmetric(vertical: responsive.altoP(3)),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    costVip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  'What you\'ll get:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                ...featuresVip
                    .map((feature) => FeatureVIP(
                          feature: feature,
                          responsive: responsive,
                        ))
                    .toList(),
                ...featuresVip
                    .map((feature) => FeatureVIP(
                          feature: feature,
                          responsive: responsive,
                        ))
                    .toList(),
                ...featuresVip
                    .map((feature) => FeatureVIP(
                          feature: feature,
                          responsive: responsive,
                        ))
                    .toList(),
                ...featuresVip
                    .map((feature) => FeatureVIP(
                          feature: feature,
                          responsive: responsive,
                        ))
                    .toList(),
                SizedBox(height: responsive.altoP(5)),
                // Spacer(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: responsive.altoP(5), top: responsive.altoP(2)),
          child: Center(
            child: CustomButton(
              onPressed: () {
                utils.showDialogConfirm(context, 'Confirm Payment',
                    'Are you sure you want to make this payment of \$60/month using card 0745? ',
                    () {
                  context.read<VipBloc>().add(GetVip());
                  Navigator.pop(context);
                });
              },
              title: 'Become VIP',
              gradient: false,
              colorPrimary: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
