import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_counter_app/utils/helper_utils/extensions.dart';
import 'package:weather_counter_app/utils/ui_utils/colors.dart';
import 'package:weather_counter_app/utils/ui_utils/shadows.dart';
import 'package:weather_counter_app/utils/ui_utils/text_styles.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    this.header,
    required this.subtitle,
    required this.value,
    required this.label,
    this.errorText,
    this.loading = false,
    this.onReset,
  });

  final String? header;
  final String subtitle;
  final int value;
  final String label;
  final String? errorText;
  final bool loading;
  final void Function()? onReset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header ?? "",
                style: TextStyles.header,
              ),
              IconButton(
                onPressed: onReset,
                icon: const Icon(
                  Icons.restore_outlined,
                  color: MyColors.label,
                ),
              ),
            ],
          ),
        loading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: context.width,
                  height: 90,
                  padding: 12.edgeInsets,
                  margin: 24.bottomEdgeInsets,
                  decoration: BoxDecoration(
                    borderRadius: 8.borderRadius,
                    boxShadow: defaultBoxShadows,
                    color: MyColors.foreground,
                  ),
                ),
              )
            : Container(
                width: context.width,
                height: 90,
                padding: 12.edgeInsets,
                margin: 24.bottomEdgeInsets,
                decoration: BoxDecoration(
                  borderRadius: 8.borderRadius,
                  boxShadow: defaultBoxShadows,
                  color: MyColors.foreground,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyles.regular,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$value",
                          style: TextStyles.highlight,
                        ),
                        4.horizontalSpacing,
                        Text(
                          label,
                          style: TextStyles.label,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
