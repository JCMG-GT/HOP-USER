import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/logic/bloc/vip/vip_bloc.dart';
import 'package:hopapp/src/pages/vip/widgets/widgets_vip.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/utils/responsive.dart';

class VipContent extends StatelessWidget {
  const VipContent({
    Key? key,
    required this.responsive,
    required this.nameBar,
    required this.featuresVip,
    required this.costVip,
    required this.startDate,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final String nameBar, costVip, startDate;
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
                SizedBox(height: responsive.altoP(3)),
                Text(
                  'What you get:',
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
                SizedBox(
                    height:
                        responsive.altoP(featuresVip.length < 3 ? 16.0 : 5.0)),
                Divider(),
                _FeatureVipGaranted(title: 'Price', feature: costVip),
                Divider(),
                _FeatureVipGaranted(title: 'Start Date', feature: startDate),
                Divider(),
                SizedBox(height: responsive.altoP(4)),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: responsive.altoP(5), top: responsive.altoP(2)),
          child: Center(
            child: Center(
              child: CustomButton(
                onPressed: () {
                  BlocProvider.of<VipBloc>(context).add(CancelVip());
                },
                title: 'Cancel membership',
                backGroundGray: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureVipGaranted extends StatelessWidget {
  const _FeatureVipGaranted({
    Key? key,
    required this.feature,
    required this.title,
  }) : super(key: key);

  final String feature;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            feature,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
