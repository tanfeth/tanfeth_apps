
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/map_widget.dart';


class TaxiPassengerHomeView extends ConsumerStatefulWidget {
  const TaxiPassengerHomeView({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PassengerHomeView();
}

class _PassengerHomeView extends ConsumerState<TaxiPassengerHomeView> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        closeKeyBoard();
      },
      child: Stack(
        children: [
          MapWidget(),
        //  GetDiscountWidget(),
        ],
      ),
    );
  }
}
