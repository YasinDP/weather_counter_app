import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future showToast(String message, {bool shortToast = true}) async {
  if (!kIsWeb) {
    await Fluttertoast.cancel();
  }
  Fluttertoast.showToast(
      msg: message,
      toastLength: shortToast ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG);
}
