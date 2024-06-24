import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';

class RiderInstructionCell extends ConsumerStatefulWidget {
  final String title;
  const RiderInstructionCell({required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiderInstructionCell();
}

class _RiderInstructionCell extends ConsumerState<RiderInstructionCell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.check,
              size: 24,
              color: context.color.primary,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(widget.title, textAlign: TextAlign.start),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
