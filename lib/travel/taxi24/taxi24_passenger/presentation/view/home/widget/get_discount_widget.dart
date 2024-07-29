import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';


class GetDiscountWidget extends ConsumerStatefulWidget{
  const GetDiscountWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetDiscount();
  
}

class _GetDiscount extends ConsumerState<GetDiscountWidget>{
  @override
  Widget build(BuildContext context) {
    return ShakeY(
      infinite: true,
        duration: const Duration(milliseconds: 10000),
        child: Container(
          color: context.color.primary,
          margin: EdgeInsets.all(30),
          child: SizedBox(
            height: 50,
            width: 100,
          ),
        )
    );
  }
  
}