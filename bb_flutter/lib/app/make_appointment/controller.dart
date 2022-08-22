import 'package:get/get.dart';

class MakeAppointmentController extends GetxController {
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;
  DateTime selectedTime;

  changeDateIndex(int index) {
    selectedDateIndex = index;
    selectedTimeIndex = -1;
    selectedTime = null;
    update();
  }

  changeTimeIndex(int index, DateTime time) {
    selectedTimeIndex = index;
    selectedTime = time;
    update();
  }
}
