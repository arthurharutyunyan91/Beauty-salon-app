import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/tabs/favorites_tab/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:get/get.dart';

import '../../../../widget/business_item/business_item.dart';

class FavoritesTab2 extends StatelessWidget {
  final _controller = Get.put(FavoritesTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        brightness: Brightness.dark,
        backgroundColor: RColors.backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<FavoritesTabController>(
        builder: (_) {
          return _FavoritesList(
            //TODO check key need
            key: UniqueKey(),
            favorites: _controller.favorites,
            onItemTap: _controller.goToBusinessDetails,
          );
        },
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  final favorites;
  final Function(Business) onItemTap;
  final Function(List<Business>) onDateLoaded;

  _FavoritesList(
      {@required this.favorites, this.onDateLoaded, this.onItemTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            var favoriteBusiness = favorites[index];
            return BusinessWidget(
              business: favoriteBusiness,
              onTap: () => onItemTap(favoriteBusiness),
            );
          }),
    );
  }
}
