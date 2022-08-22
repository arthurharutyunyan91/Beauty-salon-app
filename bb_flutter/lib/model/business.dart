import 'package:flutter/material.dart';
import 'package:flutter_app/model/review.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/model/working_hour.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Business {
  final String imageUrl;
  final String name;
  final String address;
  final int distance;
  final double starCount;
  final int reviewCount;
  final bool favorite;

  final LatLng latLng;
  final List<Service> serviceList;
  final List<int> phoneNumbersList;
  final List<WorkingHour> workingHourList;
  final List<Staffer> staffers;
  final List<Review> reviews;
  final List<String> categories;

  Business({
    @required this.imageUrl,
    @required this.name,
    @required this.address,
    @required this.distance,
    @required this.starCount,
    @required this.reviewCount,
    @required this.latLng,
    @required this.serviceList,
    @required this.phoneNumbersList,
    @required this.staffers,
    @required this.workingHourList,
    @required this.reviews,
    @required this.favorite,
    @required this.categories,
  });
}
