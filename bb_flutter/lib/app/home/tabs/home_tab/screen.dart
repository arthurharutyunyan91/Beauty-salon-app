import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/main/controller.dart';
import 'package:flutter_app/app/home/tabs/home_tab/controller.dart';
import 'package:flutter_app/model/business_sale.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/text/divider_with_text.dart';
import 'package:get/get.dart';

import '../../../../util/strings.dart';
import '../../../../widget/staffer/staffer_item.dart';

class HomeTab2 extends StatelessWidget {
  final MainController mainController = Get.find();
  final controller = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final curvedButtonBarHeight = query.height * 0.25;
    return Container(
      color: RColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CurvedButtonBar(
              widgetHeight: curvedButtonBarHeight,
              onHairTap: () => controller.goToCategory(hairCategory),
              onNailTap: () => controller.goToCategory(nailCategory),
              onMakeUpTap: () => controller.goToCategory(makeUpCategory)),
          DividerWithText(
            marginTop: 40,
            text: 'Most popular offers',
          ),
          _BusinessSales(
            sales: mainController.businessSales,
          ),
          DividerWithText(
            marginTop: 40,
            text: 'Most booked professionals',
          ),
          _Professionals(
            staffers: mainController.popularStaffers,
          ),
        ],
      ),
    );
  }
}

class _CurvedButtonBar extends StatelessWidget {
  final double widgetHeight;
  final Function onHairTap;
  final Function onNailTap;
  final Function onMakeUpTap;
  final _iconSize = 60.0;

  _CurvedButtonBar({
    this.widgetHeight,
    this.onHairTap,
    this.onNailTap,
    this.onMakeUpTap,
  });

  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
            width: widgetWidth,
            height: widgetHeight,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: RColors.blackShadowColor,
                    blurRadius: 15.0,
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                  )
                ],
                color: RColors.curvedBarColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(180, 120),
                    bottomRight: Radius.elliptical(180, 120)))),
        Positioned(
          left: widgetWidth * 0.2 - _iconSize / 2,
          top: widgetHeight * 0.3,
          child: _IconButtonWithText(
            name: 'Hair',
            assetImage: 'assets/images/cat_hair.png',
            iconSize: _iconSize,
            onPressed: onHairTap,
          ),
        ),
        Positioned(
          left: widgetWidth * 0.5 - _iconSize / 2,
          top: widgetHeight * 0.5,
          child: _IconButtonWithText(
            name: 'Nail',
            assetImage: 'assets/images/cat_nail.png',
            iconSize: _iconSize,
            onPressed: onNailTap,
          ),
        ),
        Positioned(
          left: widgetWidth * 0.8 - _iconSize / 2,
          top: widgetHeight * 0.3,
          child: _IconButtonWithText(
            name: 'Make Up',
            assetImage: 'assets/images/cat_make_up.png',
            iconSize: _iconSize,
            onPressed: onMakeUpTap,
          ),
        ),
      ],
    );
  }
}

class _IconButtonWithText extends StatelessWidget {
  final String name;
  final String assetImage;
  final double iconSize;
  final double textSize;
  final Color iconColor;
  final Color textColor;
  final Function onPressed;

  _IconButtonWithText(
      {@required this.name,
      @required this.assetImage,
      @required this.onPressed,
      this.iconSize = 50,
      this.iconColor = RColors.primaryColor,
      this.textColor = RColors.primaryColor,
      this.textSize = 15});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: RColors.primaryColor)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ImageIcon(
                  AssetImage(assetImage),
                  size: iconSize - 10,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BusinessSales extends StatelessWidget {
  final List<BusinessSale> sales;

  _BusinessSales({@required this.sales});

  @override
  Widget build(BuildContext context) {
    //TODO remove height and calculate by widget weight or margin
    final widgetHeight = MediaQuery.of(context).size.height * 0.28;
    return Container(
      height: widgetHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sales?.length ?? 0,
        itemBuilder: (context, index) {
          return _BusinessSaleItem(sales[index], widgetHeight);
        },
      ),
    );
  }
}

class _BusinessSaleItem extends StatelessWidget {
  final BusinessSale salonAdd;
  final double widgetHeight;

  _BusinessSaleItem(this.salonAdd, this.widgetHeight);

  @override
  Widget build(BuildContext context) {
    //TODO remove width and calculate by widget weight or margin
    final widgetWidth = MediaQuery.of(context).size.width * 0.8;
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Container(
        key: ValueKey(salonAdd.hashCode),
        width: widgetWidth,
        child: Stack(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/load1.gif',
              height: double.infinity,
              width: double.infinity,
              image: salonAdd.imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: widgetWidth * 0.25,
                height: 20,
                color: RColors.blackTransparentOverlay,
                child: Center(
                    child: Text(
                  'Save ${salonAdd.oldPrice - salonAdd.newPrice} \$',
                  style: TextStyle(
                    fontSize: 12,
                    color: RColors.secondaryColor,
                  ),
                )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widgetWidth,
                height: widgetHeight * 0.25,
                color: RColors.blackTransparentOverlay,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '${salonAdd.name}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${salonAdd.address}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '${salonAdd.cutName}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '${salonAdd.newPrice}\$',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '${salonAdd.oldPrice}\$',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Professionals extends StatelessWidget {
  final List<Staffer> staffers;
  final HomeTabController controller = Get.find();

  _Professionals({@required this.staffers});

  @override
  Widget build(BuildContext context) {
    //TODO remove height and calculate by widget weight or margin
    final widgetHeight = MediaQuery.of(context).size.height * 0.15;
    return Container(
      height: widgetHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: staffers?.length ?? 0,
        itemBuilder: (context, index) {
          var staffer = staffers[index];
          //TODO define new flow from home page
          return StafferItem(
            staffer: staffer,
            homePage: true,
            onStafferTap: () => controller.goToPortfolio(staffer),
          );
        },
      ),
    );
  }
}
