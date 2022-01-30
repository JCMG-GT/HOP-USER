import 'package:flutter/material.dart';
import 'package:hopapp/src/config/app_colors.dart';

class CirclesBlue extends StatelessWidget {
  final String icono;
  final String route;
  final bool? click;
  final index;

  const CirclesBlue(
      {Key? key,
      required this.icono,
      this.click,
      required this.route,
      this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return click! ? contenedorColor() : contenedorBlack();
  }

  Widget contenedorBlack() {
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x88999999), offset: Offset(0, 5), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Image.asset(
              icono,
              color: AppColors.gris,
            ),
          ),
        ));
  }

  Widget contenedorColor() {
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x88999999), offset: Offset(0, 5), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            colors: [Color(0xff3158df), Color(0xff5329ac)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Image.asset(
              icono,
              color: Colors.white,
            ),
          ),
        ));
  }
}
