import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_counter_app/ui/widgets/weather_data_view.dart';
import 'package:weather_counter_app/utils/helper_utils/extensions.dart';
import 'package:weather_counter_app/implementations/counter_notifier.dart';
import 'package:weather_counter_app/implementations/weather_notifier.dart';
import 'package:weather_counter_app/ui/widgets/counter_button.dart';
import 'package:weather_counter_app/ui/widgets/counter_view.dart';
import 'package:weather_counter_app/utils/ui_utils/colors.dart';
import 'package:weather_counter_app/utils/ui_utils/text_styles.dart';

final counterNotifier = ChangeNotifierProvider<CounterNotifier>(
  (ref) => CounterNotifier(),
);

final weatherNotifier = ChangeNotifierProvider<WeatherNotifier>(
  (ref) => WeatherNotifier(),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: MyColors.primary,
        elevation: 0,
        title: const Text(
          "Interview app",
          style: TextStyles.bold,
        ),
        centerTitle: true,
      ),
      backgroundColor: MyColors.background,
      body: Padding(
        padding: 12.edgeInsets,
        child: Column(
          children: [
            const CounterView(),
            16.spacing,
            const WeatherDataView(),
            const Spacer(),
            const CounterButton()
          ],
        ),
      ),
    );
  }
}
