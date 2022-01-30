part of 'widgets.dart';

class CustomAppBarColumn extends StatelessWidget {
  const CustomAppBarColumn({
    Key? key,
    required this.responsive,
    required this.title,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsive.altoP(2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: CircleButtomCustom(
              icon: Icons.close,
              iconColor: AppColors.primary,
              function: () {
                Navigator.pop(context);
              },
              marginRigth: 0.0,
            ),
          ),
          SizedBox(height: responsive.altoP(3)),
          BarTitle(
            nameBar: title,
            key: Key('key_VIP'),
          ),
        ],
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BarTitle(nameBar: title),
        CircleButtomCustom(
          icon: Icons.close,
          iconColor: AppColors.primary,
          function: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
