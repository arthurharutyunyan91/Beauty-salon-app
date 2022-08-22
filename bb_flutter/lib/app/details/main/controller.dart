import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/util/strings.dart';
import 'package:get/get.dart';

import '../../../model/business_sale.dart';
import '../../../model/staffer.dart';
import '../../../repository/mock_repository/mock_repository.dart';

class DetailsMainController extends GetxController {
  final Business business;

  DetailsMainController(this.business);
}
