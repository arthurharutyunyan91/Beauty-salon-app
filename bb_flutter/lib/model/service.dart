
import 'package:flutter/material.dart';

class Service {
  final String serviceName;
  final int servicePrice;
  final int serviceDurationMinutes;

  Service({
    @required this.serviceName,
    @required this.servicePrice,
    @required this.serviceDurationMinutes,
  });
}