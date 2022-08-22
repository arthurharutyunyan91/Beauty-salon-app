
import 'package:flutter/material.dart';

class BusinessSale {
  final String imageUrl;
  final String name;
  final String address;
  final String cutName;
  final int oldPrice;
  final int newPrice;

  BusinessSale({
    @required this.imageUrl,
    @required this.name,
    @required this.address,
    @required this.cutName,
    @required this.oldPrice,
    @required this.newPrice,
  });
}
