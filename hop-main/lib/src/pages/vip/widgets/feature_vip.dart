part of 'widgets_vip.dart';

class FeatureVIP extends StatelessWidget {
  const FeatureVIP({
    Key? key,
    required this.responsive,
    required this.feature,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final String feature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: responsive.altoP(3), left: 20.0),
      child: Text(
        feature,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
