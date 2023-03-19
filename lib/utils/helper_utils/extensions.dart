import 'package:flutter/material.dart';

extension ScreenSizeExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  bool get isMobile => width < 768;
  bool get isTablet => width >= 768 && width <= 1024;
  bool get isDesktop => width > 1024;
}

extension MaterialColorSwap on Color {
  MaterialStateProperty<Color> get material {
    return MaterialStateProperty.all(this);
  }
}

extension MaterialEdgeInsetsSwap on EdgeInsets {
  MaterialStateProperty<EdgeInsets> get material {
    return MaterialStateProperty.all(this);
  }
}

extension UIExtensions on num {
  // Spacing
  SizedBox get verticalSpacing => SizedBox(height: toDouble());
  SizedBox get horizontalSpacing => SizedBox(width: toDouble());
  SizedBox get spacing => SizedBox(width: toDouble(), height: toDouble());

  // BorderRadius
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  // EdgeInsets
  EdgeInsets get edgeInsets => EdgeInsets.all(toDouble());
  EdgeInsets get verticalEdgeInsets =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get horizontalEdgeInsets =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get rightEdgeInsets => EdgeInsets.only(right: toDouble());
  EdgeInsets get leftEdgeInsets => EdgeInsets.only(left: toDouble());
  EdgeInsets get topEdgeInsets => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomEdgeInsets => EdgeInsets.only(bottom: toDouble());
}

extension TemperatureSwaps on double {
  int get celsius => (this - 273.15).toInt();
}
