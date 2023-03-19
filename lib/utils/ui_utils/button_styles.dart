import 'package:flutter/material.dart';
import 'package:weather_counter_app/utils/helper_utils/extensions.dart';
import 'package:weather_counter_app/utils/ui_utils/colors.dart';

class ButtonStyles {
  static final ButtonStyle primary = ButtonStyle(
    backgroundColor: MyColors.primary.material,
    padding: 14.edgeInsets.material,
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: 8.borderRadius,
      ),
    ),
  );
}
