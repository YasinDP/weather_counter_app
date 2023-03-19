import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    updateValues();
    saveCount();
  }

  void reset() {
    _count = 0;
    updateValues();
    saveCount();
  }

  void saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _count);
  }

  Future<void> restoreCount() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final int? counter = prefs.getInt('counter');
      if (counter != null) {
        _count = counter;
        updateValues();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateValues() => notifyListeners();
}
