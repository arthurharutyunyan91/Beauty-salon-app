import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/business_sale.dart';
import 'package:flutter_app/model/staffer.dart';

mixin Repository {
  Future<List<BusinessSale>> fetchBusinessSales();
  Future<List<Staffer>> fetchMostPopularStaffers();
  Future<List<Business>> fetchBusinesses();
  Future<List<Business>> fetchBusinessesByCategory(int categoryIndex);
  Future<List<Business>> fetchFavoriteBusinesses();
  Future<List<Appointment>> fetchAppointments();
}
