import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/business_sale.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/repository/repository.dart';
import '../../mock_functions.dart';

class MockRepository with Repository {
  @override
  Future<List<BusinessSale>> fetchBusinessSales() async {
    List<BusinessSale> list;
    await Future.delayed(Duration(milliseconds: 500), () {
      list = createSalonAddList();
    });
    return list;
  }

  @override
  Future<List<Staffer>> fetchMostPopularStaffers() async {
    List<Staffer> list;
    await Future.delayed(Duration(milliseconds: 500), () {
      list = createProfessionalList();
    });
    return list;
  }

  //TODO remove this
  @override
  Future<List<Business>> fetchBusinesses() async {
    List<Business> list = generateSalonList(0, false, 'Name');
    return list;
  }

  @override
  Future<List<Business>> fetchBusinessesByCategory(int categoryIndex) async {
    List<Business> list;
    await Future.delayed(Duration(milliseconds: 500), () {
      list = generateSalonList(categoryIndex, false, 'Name');
    });
    return list;
  }

  @override
  Future<List<Business>> fetchFavoriteBusinesses() async {
    List<Business> list;
    await Future.delayed(Duration(milliseconds: 2000), () {
      list = generateSalonList(1, true, 'Name');
    });
    return list;
  }

  @override
  Future<List<Appointment>> fetchAppointments() async {
    return createAppointmentsList();
  }
}
