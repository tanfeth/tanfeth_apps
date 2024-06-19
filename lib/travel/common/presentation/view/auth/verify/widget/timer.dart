import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

class TimerWidget extends StatelessWidget {
  final void Function()? onEnd;

  const TimerWidget({super.key, this.onEnd});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: const Duration(seconds: 40),
      tween: Tween(begin: const Duration(seconds: 40), end: Duration.zero),
      onEnd: onEnd,
      builder: (BuildContext context, Duration value, Widget? child) {
        final minutes = value.inMinutes;
        final seconds = value.inSeconds % 60;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            3.ph,
            Text(
              '$minutes:$seconds',
              style: context.text.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.color.onPrimaryContainer,
              ),
            ),
          ],
        );
      },
    );
  }
}
