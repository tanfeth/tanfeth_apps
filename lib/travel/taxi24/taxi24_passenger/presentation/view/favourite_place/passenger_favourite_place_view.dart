import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/favourite_place/widget/empty_favourite.dart';

class FavouritePlace extends StatefulWidget {
  const FavouritePlace({super.key});

  @override
  State<FavouritePlace> createState() => _FavouritePlaceState();
}

class _FavouritePlaceState extends State<FavouritePlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title:LangEnum.favourite.tr() ,leadingWidget: BackButtonWidget()),
      body:WebWidth(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: EmptyFavoriteList(),
        )) ,
    );
  }
}
