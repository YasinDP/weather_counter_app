import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_counter_app/utils/ui_utils/button_styles.dart';
import 'package:weather_counter_app/utils/helper_utils/extensions.dart';
import 'package:weather_counter_app/ui/pages/home_page.dart';
import 'package:weather_counter_app/utils/ui_utils/text_styles.dart';

class CounterButton extends ConsumerWidget {
  const CounterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(counterNotifier);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: 16.horizontalEdgeInsets,
            child: ElevatedButton(
              onPressed: provider.increment,
              style: ButtonStyles.primary,
              child: Text(
                "Add count",
                style: TextStyles.header.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
