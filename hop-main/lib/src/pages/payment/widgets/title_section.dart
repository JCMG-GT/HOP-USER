part of 'widgets_payment.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.responsive,
    required this.title,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.anchoP(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BarTitle(
            nameBar: title,
            key: this.key,
          ),
          Container(
            margin: EdgeInsets.only(top: responsive.altoP(1.0)),
            height: 3.5,
            width: responsive.anchoP(45),
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
