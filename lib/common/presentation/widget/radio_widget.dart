import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';


class RadioWidget extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged onChanged;
  final String? trailingValue;
  final String? optionImage;
  final Color?color;

  const RadioWidget({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,

    this.trailingValue,
    this.optionImage, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onChanged(value),
      child: Row(
        children: [
          CircleAvatar(
            radius: MySizes.defaultPadding * .7,
            backgroundColor: context.color.primaryContainer,
            child: CircleAvatar(
              radius: MySizes.defaultPadding * .4,
              backgroundColor: value == groupValue ? color?? context.color.primary : context.color.primaryContainer,
            ),
          ),
          if ((optionImage ?? '').isNotEmpty) ...[
            const SizedBox(width: MySizes.defaultPadding * .5),
            Container(
              decoration: BoxDecoration(
                borderRadius: MySizes.borderRadius * .6,
                color: context.color.primaryContainer,
                image: DecorationImage(image: NetworkImage(optionImage ?? ''), fit: BoxFit.cover),
              ),
              width: MySizes.largePadding,
              height: MySizes.largePadding,
            ),
          ],
          const SizedBox(width: MySizes.defaultPadding * .5),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, 2),
              child: Text(
                label,
                style: context.text.bodyMedium,
              ),
            ),
          ),
          if ((trailingValue ?? '').isNotEmpty) ...[
            const Spacer(),
            Transform.translate(
              offset: const Offset(0, 2),
              child: Text(
                '$trailingValue',
                style: context.text.titleSmall?.copyWith(color: context.color.primary),
              ),
            )
          ],
        ],
      ),
    );
  }
}
