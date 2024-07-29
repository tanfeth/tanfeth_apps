import 'package:flutter/material.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? appBarColor;
  final String? title;
  final TextAlign? textAlign;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? titleWidget;
  final Widget? searchWidget;
  final BorderRadiusGeometry? borderRadius;

  const MainAppBar({
    super.key,
    this.appBarColor,
    this.title,
    this.textAlign,
    this.leadingWidget,
    this.trailingWidget,
    this.titleWidget,
    this.borderRadius, this.searchWidget,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQueryData.fromView(View.of(context)).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      width: double.infinity,
      height: preferredSize.height + statusBarHeight,
      decoration: BoxDecoration(
        color: appBarColor ?? context.color.surface,
        borderRadius: borderRadius,
      ),
      child: SizedBox(
        height: preferredSize.height,
        child:searchWidget?? Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            leadingWidget ?? SizedBox(width: preferredSize.height, height: preferredSize.height),
            if (title != null) ...[
              Expanded(
                child: Transform.translate(
                  offset: const Offset(0, 3),
                  child: Text(
                    title ?? '',
                    textAlign: textAlign ?? TextAlign.center,
                    style: context.text.bodyLarge?.copyWith(
                      color: appBarColor != null ? context.color.onPrimary : context.color.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ] else if (titleWidget != null) ...[
              Expanded(child: titleWidget ?? const SizedBox.shrink()),
            ] else ...[
              const Spacer(),
            ],
            trailingWidget ?? SizedBox(width: preferredSize.height, height: preferredSize.height),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(MySizes.appBarHeight);
}
