import 'dart:async';
import 'dart:io';
import 'package:retry/retry.dart';

import 'package:dio/dio.dart';

int getCelcius(double kelvin) {
  double resultInCelsius = (kelvin - 273.15);
  return resultInCelsius.toInt();
}

double getDouble(dynamic value) {
  double result = 0;
  if (value is String) {
    result = double.tryParse(value) ?? 0;
  } else if (value is num) {
    result = value.toDouble();
  }
  return result;
}

int getInt(dynamic value) {
  int result = 0;
  if (value is String) {
    result = int.tryParse(value) ?? 0;
  } else if (value is num) {
    result = value.toInt();
  }
  return result;
}

extension FutureExtensions<T> on FutureOr<T> {
  FutureOr<T> retryTask({bool retry = true, int? count}) async {
    if (!retry) {
      return this;
    }
    RetryOptions r = RetryOptions(
      maxAttempts: count ?? 8,
      delayFactor: const Duration(milliseconds: 200),
    );
    return await r.retry(
      () => this,
      retryIf: (e) =>
          e is SocketException || e is TimeoutException || e is DioError,
    );
  }
}
