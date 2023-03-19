import 'package:flutter/widgets.dart';
import 'package:weather_counter_app/utils/ui_utils/colors.dart';

class TextStyles {
  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const TextStyle header = TextStyle(
    fontSize: 18,
    color: MyColors.label,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle regular = TextStyle(
    color: MyColors.text,
  );

  static const TextStyle highlight = TextStyle(
    fontSize: 24,
    color: MyColors.text,
    fontWeight: FontWeight.w600,
  );

  static TextStyle label = TextStyle(
    fontSize: 16,
    color: MyColors.label.withOpacity(0.7),
    fontWeight: FontWeight.w500,
  );
}
