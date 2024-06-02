
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';


class HomeView extends ConsumerStatefulWidget{
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WebWidth(
        child: SizedBox(),
      ),
    );
  }

}
