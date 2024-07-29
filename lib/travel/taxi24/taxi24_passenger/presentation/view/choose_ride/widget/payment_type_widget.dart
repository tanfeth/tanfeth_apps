

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';

class PaymentTypeWidget extends ConsumerStatefulWidget{

  final String title;
  final String image;
  final Color? color;


  const PaymentTypeWidget({super.key,
  required this.title,
  required this.image,
   this.color});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_PaymentTypeWidget();
  
  
  
}

class _PaymentTypeWidget extends ConsumerState<PaymentTypeWidget>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(
                widget.image,
                colorFilter: widget.color != null?
                ColorFilter.mode(
                    widget.color??context.color.primary,
                    BlendMode.srcIn):null,
                width: 20,
                height: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.title,

              ),
            ],
          ),
        ),

        SvgPicture.asset(
          ref.watch(languageProvider) =='en'?
              Images.arrowSVG:
              Images.arrowLeftSVG,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
              context.color.onSurface,
              BlendMode.srcIn),
        ),
      ],
    );
  }
  
}