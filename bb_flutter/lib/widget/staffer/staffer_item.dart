import 'package:flutter/material.dart';

import '../../model/staffer.dart';

class StafferItem extends StatelessWidget {
  final Staffer staffer;
  final bool homePage;
  final Function() onStafferTap;

  StafferItem(
      {this.homePage = false,
      @required this.onStafferTap,
      @required this.staffer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStafferTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: 8, right: 12),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/load1.gif',
                    image: staffer.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  staffer.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  homePage ? staffer.salon : staffer.profession,
                  style: TextStyle(color: Colors.white30, fontSize: 8),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
