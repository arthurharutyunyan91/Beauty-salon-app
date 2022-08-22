
import 'package:flutter/material.dart';

class Staffer {
  final String imageUrl;
  final String name;
  final String salon;
  final String profession;
  final String info;
  final List<String> portfolio;

  Staffer({
    @required this.imageUrl,
    @required this.name,
    @required this.salon,
    @required this.profession,
    @required this.info,
    @required this.portfolio,
  });
}