import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class ResponsiveUtil {
  double? width, height, diagonal;

  ResponsiveUtil(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    diagonal = math.sqrt(math.pow(width!, 2) + math.pow(height!, 2));
  }

  double anchoP(double porcentaje) {
    return width! * porcentaje / 100;
  }

  double altoP(double porcentaje) {
    return height! * porcentaje / 100;
  }

  double diagonalP(double porcentaje) {
    return diagonal! * porcentaje / 100;
  }

  bool isHorizontal() {
    bool resul = false;
    if (width! > height!) {
      resul = true;
    }
    return resul;
  }

  bool isVertical() {
    bool resul = false;
    if (height! > width!) {
      resul = true;
    }
    return resul;
  }
}
