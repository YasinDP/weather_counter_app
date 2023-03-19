import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_counter_app/implementations/weather_notifier.dart';
import 'package:weather_counter_app/ui/pages/home_page.dart';
import 'package:weather_counter_app/ui/widgets/content_card.dart';
import 'package:weather_counter_app/utils/helper_utils/alerts.dart';
import 'package:weather_counter_app/utils/helper_utils/extensions.dart';
import 'package:weather_counter_app/utils/helper_utils/functions.dart';
import 'package:weather_counter_app/utils/ui_utils/colors.dart';
import 'package:weather_counter_app/utils/ui_utils/text_styles.dart';

class WeatherDataView extends ConsumerStatefulWidget {
  const WeatherDataView({
    super.key,
  });

  @override
  ConsumerState<WeatherDataView> createState() => _WeatherDataViewState();
}

class _WeatherDataViewState extends ConsumerState<WeatherDataView> {
  late WeatherNotifier provider;
  late bool init;
  late bool loading;

  void update() async {
    if (!await isNetworkAvailable()) {
      showToast(
        "Couldnt update weather data because you are not connected to any network",
      );
      return;
    }
    setState(() {
      loading = true;
    });
    await provider.fetchWeatherData();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    init = true;
    loading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    provider = ref.read(weatherNotifier);
    if (init) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await provider.restoreWeatherData();
        setState(() {
          loading = false;
        });
        init = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(weatherNotifier);
    return provider.data == null
        ? Container(
            width: context.width,
            padding: 24.edgeInsets,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Couldnt fetch weather data.\nPls try again later.",
                    textAlign: TextAlign.center,
                    style: TextStyles.label,
                  ),
                  IconButton(
                    onPressed: update,
                    icon: const Icon(
                      Icons.restore_outlined,
                      color: MyColors.label,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Column(
            children: [
              ContentCard(
                header: "Weather",
                subtitle: "It is currently",
                value: provider.data?.tempInKelvin.celsius ?? 0,
                label: "°C",
                loading: loading,
                onReset: update,
              ),
              ContentCard(
                subtitle: "with a humidity of",
                value: provider.data?.humidity ?? 0,
                label: "%",
                loading: loading,
              ),
            ],
          );
  }
}
