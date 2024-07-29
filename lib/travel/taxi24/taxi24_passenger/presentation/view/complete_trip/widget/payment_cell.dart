
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';

class PaymentCell extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showCheckButton;
  final Widget? trailing;
  final Widget? subWidget;


  const PaymentCell({
    super.key,
    required this.isSelected,
    required this.title,
    required this.image,
    required this.onTap,
    this.showCheckButton  = true,
    this.trailing,
    this.subWidget
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(MySizes.defaultPadding),
        decoration: BoxDecoration(
          borderRadius: MySizes.borderRadius,
          border: Border.all(width: 1.5, color: context.color.primaryContainer),
        ),
        child: Column(
          children: [
            Row(
              children: [
                if(showCheckButton)
                  CircleAvatar(
                    radius: MySizes.defaultPadding * .7,
                    backgroundColor: context.color.primaryContainer,
                    child: CircleAvatar(
                      radius: MySizes.defaultPadding * .4,
                      backgroundColor:
                      isSelected ? context.color.primary : context.color.primaryContainer,
                    ),
                  ),

                10.pw,

                Expanded(
                  child: Text(
                    title,
                    style: context.text.bodySmall?.copyWith(
                      color: context.color.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                if(trailing == null)...[
                  SizedBox(
                    height:MySizes.defaultPadding ,
                    child: Image.asset(image, fit: BoxFit.fill),
                  ),
                ]else...[
                  trailing??const SizedBox.shrink()
                ]

              ],
            ),

            if(subWidget != null)
              subWidget?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
