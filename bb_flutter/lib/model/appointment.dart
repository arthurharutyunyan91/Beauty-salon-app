import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';

class Appointment {
  final String status;
  final Business business;
  final Service service;
  final int bookDate;
  final Staffer staffer;

  Appointment(
      {@required this.status,
      @required this.business,
      @required this.service,
      @required this.bookDate,
      @required this.staffer});
}
