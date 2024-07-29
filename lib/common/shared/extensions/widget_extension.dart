import 'package:flutter/cupertino.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/sizes.dart';

extension AlertEx on (String string, BuildContext context) {
  Widget get alertDanger => Container(
        decoration: BoxDecoration(
          borderRadius: MySizes.borderRadius,
          color: const Color(0xfff8d7da),
          border: Border.all(color: const Color(0xffecbfc3)),
        ),
        width: double.maxFinite,
        padding: (10, 15).toSymmetric,
        child: Transform.translate(
          offset: const Offset(0, 1.6),
          child: Text(
            $1,
            style: $2.text.bodyMedium?.copyWith(
              color: const Color(0xff721c24),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );

  Widget get alertSuccess => Container(
        decoration: BoxDecoration(
          borderRadius: MySizes.borderRadius,
          color: const Color(0xffd4edda),
          border: Border.all(color: const Color(0xffc3e6cb)),
        ),
        width: double.maxFinite,
        padding: (10, 15).toSymmetric,
        child: Transform.translate(
          offset: const Offset(0, 1.6),
          child: Text(
            $1,
            style: $2.text.bodyMedium?.copyWith(
              color: const Color(0xff155724),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );

  Widget get alertWarning => Container(
        decoration: BoxDecoration(
          borderRadius: MySizes.borderRadius,
          color: const Color(0xfffff3cd),
          border: Border.all(color: const Color(0xfff1e1af)),
        ),
        width: double.maxFinite,
        padding: (10, 15).toSymmetric,
        child: Transform.translate(
          offset: const Offset(0, 1.6),
          child: Text(
            $1,
            style: $2.text.bodyMedium?.copyWith(
              color: const Color(0xff856404),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
}
