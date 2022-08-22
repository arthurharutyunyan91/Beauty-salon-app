import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/button/outline_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller.dart';

class AppointmentsTab2 extends StatelessWidget {
  final appointmentsKey = UniqueKey();
  final controller = Get.put(AppointmentsTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: RColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            'Appointments',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          brightness: Brightness.dark,
          backgroundColor: RColors.backgroundColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: GetBuilder<AppointmentsTabController>(builder: (_) {
          return _AppointmentsList(
            //TODO check key need
            key: appointmentsKey,
            appointments: controller.appointments,
          );
        }));
  }
}

class _AppointmentsList extends StatelessWidget {
  final List<Appointment> appointments;

  _AppointmentsList({@required this.appointments, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return _AppointmentItem(appointments[index]);
          },
        ),
      ),
    );
  }
}

//TODO add book again button action
class _AppointmentItem extends StatelessWidget {
  final Appointment appointmentItem;
  final AppointmentsTabController controller = Get.find();

  _AppointmentItem(this.appointmentItem);

  final List<String> _dateListOptions = ['day', 'hour', 'min', 'sec'];

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    Color _statusColor;
    var endTime = '';
    switch (appointmentItem.status) {
      case 'Done':
        _statusColor = Colors.green;
        break;
      case 'Upcoming':
        _statusColor = Colors.amber;
        endTime = '';
        break;
      case 'Canceled':
        _statusColor = Colors.red;
        endTime = '';
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Container(
        //TODO
        height: _query.height * 0.22,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                offset: Offset(
                  1.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ],
            color: RColors.backgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '${appointmentItem.service.serviceName}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        '${appointmentItem.business.name}',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                    Center(
                      child: appointmentItem.status != 'Upcoming'
                          ? MaterialButton(
                              minWidth: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 8,
                              color: RColors.primaryColor,
                              onPressed: () => controller.bookAgain(
                                  business: appointmentItem.business,
                                  service: appointmentItem.service,
                                  staffer: appointmentItem.staffer),
                              child: Text(
                                'Book Again',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : TimerWidget(
                              appointmentItem.bookDate, _dateListOptions),
                    )
                  ],
                ),
              ),
            ),
            VerticalDivider(
              indent: 6,
              endIndent: 6,
              thickness: 1.0,
              width: 0,
              color: Colors.white24,
            ),
            Container(
              width: _query.width * 0.27,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: OutlineButtonWidget(
                        text: appointmentItem.status,
                        widgetHeight: _query.height * 0.03,
                        onTap: () {},
                        color: _statusColor,
                        textSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                          ' ${DateFormat("MMMM").format(DateTime.fromMillisecondsSinceEpoch(appointmentItem.bookDate))}',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                          ' ${DateFormat("d").format(DateTime.fromMillisecondsSinceEpoch(appointmentItem.bookDate))}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                        ' ${DateFormat("Hm").format(DateTime.fromMillisecondsSinceEpoch(appointmentItem.bookDate))}$endTime',
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  final int endDate;
  final List<String> dateListOptions;

  TimerWidget(this.endDate, this.dateListOptions);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer _timer;
  int _diffSeconds = 0;

  @override
  void initState() {
    _diffSeconds =
        ((widget.endDate - DateTime.now().millisecondsSinceEpoch) * 0.001)
            .toInt();
    final oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_diffSeconds < 1) {
            timer.cancel();
          } else {
            _diffSeconds = _diffSeconds - 1;
          }
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dateList = _getDateList(Duration(seconds: _diffSeconds));
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  widget.dateListOptions[index],
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  dateList[index],
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return VerticalDivider(
            indent: 8,
            endIndent: 8,
            thickness: 0.5,
            color: Colors.white30,
          );
        },
      ),
    );
  }

  _getDateList(Duration duration) {
    List<String> dateList = [];
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    dateList.clear();
    dateList.add(twoDigits(duration.inDays));
    dateList.add(twoDigitHours);
    dateList.add(twoDigitMinutes);
    dateList.add(twoDigitSeconds);
    return dateList;
  }
}
