import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';


class CreditCardCell extends StatelessWidget {
  final dynamic card;
  final Function onCheckBoxChanged;
  final int index;
  const CreditCardCell({required this.card,
    required this.onCheckBoxChanged,
    required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>onCheckBoxChanged(!card['isDefault'],index),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  shape: const CircleBorder(),
                  tristate: true,
                  isError: true,
                  activeColor: context.color.primary,
                  value: card['isDefault'],
                  onChanged: (bool? value) =>onCheckBoxChanged(value,index),
                ),
                8.pw,
                SvgPicture.asset( card['brand']=="visa"?Images.visaSVG:Images.mastercardSVG,width: 24,height: 24,),
                16.pw,
                Text(card['cardNumber'],
                  style: context.text.titleSmall,),
              ],
            ),
          ),
          SvgPicture.asset(Images.deleteIconSVG,
            width: 20,height: 20,),
          8.pw,
        ],
      ),
    );
  }
}




