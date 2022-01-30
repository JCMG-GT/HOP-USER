part of 'widgets.dart';

class CircleButtomCustom extends StatelessWidget {
  const CircleButtomCustom({
    Key? key,
    required this.icon,
    required this.function,
    this.iconColor = Colors.grey,
    this.marginRigth = 10.0,
    this.marginTop = 0.0,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Function function;
  final double marginRigth, marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: marginRigth,
        top: marginTop,
      ),
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 3),
            )
          ]),
      child: IconButton(
        splashRadius: 25,
        onPressed: () => function(),
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
