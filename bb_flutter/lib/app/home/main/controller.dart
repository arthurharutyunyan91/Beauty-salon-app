import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/util/strings.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../model/business_sale.dart';
import '../../../model/staffer.dart';
import '../../../repository/mock_repository/mock_repository.dart';

class MainController extends GetxController {
  final navBarController = PersistentTabController(initialIndex: 0);
  int navigationIndex = 0;
  var businessCategory = hairCategory;

  List<BusinessSale> _businessSales;
  List<BusinessSale> get businessSales => _businessSales;

  List<Staffer> _popularStaffers;
  List<Staffer> get popularStaffers => _popularStaffers;

  List<Business> _businesses;
  List<Business> get businesses => _businesses;

  List<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  MainController() {
    _fetchBusinessSales();
    _fetchPopularStaffers();
    _fetchBusinesses();
    _fetchAppointments();
  }

  _fetchBusinessSales() async {
    _businessSales = await MockRepository().fetchBusinessSales();
  }

  _fetchPopularStaffers() async {
    _popularStaffers = await MockRepository().fetchMostPopularStaffers();
  }

  _fetchBusinesses() async {
    //TODO review category index : (1)
    _businesses = await MockRepository().fetchBusinessesByCategory(1);
  }

  _fetchAppointments() async {
    _appointments = await MockRepository().fetchAppointments();
  }

  // change bottom navigation bar index
  changeNavIndex(int index) {
    navigationIndex = index;
    update();
  }
}
