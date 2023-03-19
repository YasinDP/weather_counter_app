import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_counter_app/implementations/counter_notifier.dart';
import 'package:weather_counter_app/ui/pages/home_page.dart';
import 'package:weather_counter_app/ui/widgets/content_card.dart';

class CounterView extends ConsumerStatefulWidget {
  const CounterView({
    super.key,
  });

  @override
  ConsumerState<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends ConsumerState<CounterView> {
  late CounterNotifier provider;
  late bool init;
  late bool loading;

  void resetCounter() async {
    provider.reset();
  }

  @override
  void initState() {
    init = true;
    loading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    provider = ref.read(counterNotifier);
    if (init) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await provider.restoreCount();
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
    final provider = ref.watch(counterNotifier);
    return ContentCard(
      header: "Counter",
      subtitle: "You have hit the button",
      value: provider.count,
      label: "times",
      loading: loading,
      onReset: resetCounter,
    );
  }
}
