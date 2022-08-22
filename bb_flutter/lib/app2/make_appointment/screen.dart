import 'package:flutter/material.dart';
import 'package:flutter_app/app2/make_appointment/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/button/outline_button.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../mock_functions.dart';
import '../../widget/image/image.dart';

class MakeAppointmentScreen extends StatelessWidget {
  final Business business;
  final Service service;
  final Staffer staffer;

  MakeAppointmentScreen(
      {@required this.business,
      @required this.service,
      @required this.staffer});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MakeAppointmentController());
    return Scaffold(
        backgroundColor: RColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            business.name,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: RColors.backgroundColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: GetBuilder<MakeAppointmentController>(
            builder: (_) => ListView(
                  children: <Widget>[
                    _CaruselCalendarWidget(
                        selectedDateIndex: controller.selectedDateIndex,
                        onIndexChanged: controller.changeDateIndex),
                    _ScrollableHourWidget(
                      freeHoursList: generateFreeHoursList(business),
                      onItemTap: controller.changeTimeIndex,
                      selectedTimeIndex: controller.selectedTimeIndex,
                    ),
                    _ServiceInfo(
                      staffer: staffer,
                      service: service,
                    ),
                    _AppointmentInfo(
                      staffer: staffer,
                      service: service,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        highlightColor: Colors.transparent,
                        child: Text(
                          '+ Add another Service',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    _NoteBox(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: OutlineButtonWidget(
                        onTap: () {},
                        widgetHeight: 55,
                        text: 'Confirm',
                        textColor: RColors.primaryColor,
                        textSize: 22,
                        cornerRadius: 10,
                      ),
                    )
                  ],
                )));
  }
}

class _CaruselCalendarWidget extends StatelessWidget {
  final Function(int) onIndexChanged;
  final SwiperController _controller = new SwiperController();
  final selectedDateIndex;

  _CaruselCalendarWidget(
      {this.onIndexChanged, @required this.selectedDateIndex});

  @override
  Widget build(BuildContext context) {
    final widgetHeight = MediaQuery.of(context).size.height * 0.17;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: widgetHeight,
            child: Swiper(
              loop: false,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                DateTime _date = DateTime.now().add(Duration(days: index));
                DateTime date =
                    new DateTime(_date.year, _date.month, _date.day);
                return GestureDetector(
                    onTap: () {
                      _controller.move(index, animation: true);
                    },
                    child: DateItem(
                      selected: selectedDateIndex == index,
                      date: date,
                    ));
              },
              itemCount: 61,
              viewportFraction: 0.21,
              scale: 0.8,
              onIndexChanged: onIndexChanged,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: RColors.secondaryColor,
              ),
              width: 70,
              height: 4,
            ),
          )
        ],
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final bool selected;
  final DateTime date;
  final String local = 'en_US';

  DateItem({
    @required this.selected,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat("MMM", local).format(date), // Month
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: selected ? 16 : 12,
                  color: selected ? Colors.white : Colors.white30),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: selected ? 4.0 : 2.0),
              child: Text(
                date.day.toString(), // Date
                style: TextStyle(
                    fontSize: selected ? 40 : 35,
                    color: selected ? Colors.white : Colors.white30),
              ),
            ),
            Text(
              new DateFormat("E", local).format(date), // WeekDay
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: selected ? 16 : 12,
                  color: selected ? Colors.white : Colors.white30),
            )
          ],
        ),
      ),
    );
  }
}

class _ScrollableHourWidget extends StatelessWidget {
  final List<DateTime> freeHoursList;
  final Function(int index, DateTime time) onItemTap;
  final int selectedTimeIndex;

  _ScrollableHourWidget(
      {@required this.freeHoursList, this.onItemTap, this.selectedTimeIndex});

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: _query.width,
        height: _query.height * 0.06,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: freeHoursList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onItemTap(index, freeHoursList[index]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: FreeHourItem(
                  widgetWidth: _query.width * 0.23,
                  time: freeHoursList[index],
                  selected: selectedTimeIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FreeHourItem extends StatelessWidget {
  final double widgetWidth;
  final DateTime time;
  final bool selected;
  final DateFormat _dateFormat = DateFormat.Hm();

  FreeHourItem({
    @required this.widgetWidth,
    @required this.time,
    @required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: selected ? null : Border.all(color: Colors.white30),
          color: selected ? RColors.primaryColor : null),
      child: Center(
          child: Text(
        '${_dateFormat.format(time)}',
        style: TextStyle(
            color: selected ? Colors.black : Colors.white30, fontSize: 18),
      )),
    );
  }
}

class _ServiceInfo extends StatelessWidget {
  final Staffer staffer;
  final Service service;

  _ServiceInfo({@required this.staffer, @required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${staffer.profession}',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '\$ ${service.servicePrice}',
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class _AppointmentInfo extends StatelessWidget {
  final Staffer staffer;
  final Service service;
  final DateTime selectedTime;
  final DateFormat _dateFormat = DateFormat.Hm();

  _AppointmentInfo(
      {@required this.staffer, @required this.service, this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleFadeInImage(
                imageUrl: staffer.imageUrl,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  '${staffer.name}',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
          Text(
            selectedTime != null
                ? '${_dateFormat.format(selectedTime)} - '
                    '${_dateFormat.format(selectedTime.add(Duration(minutes: service.serviceDurationMinutes)))}'
                : '',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _NoteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: RColors.curvedBarColor,
          boxShadow: [
            BoxShadow(
              color: RColors.blackShadowColor,
              blurRadius: 8.0,
              offset: Offset(
                3.0,
                5.0,
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            cursorColor: Colors.white70,
            style: TextStyle(
              color: Colors.white70,
            ),
            decoration: InputDecoration.collapsed(
                hintText: "leave a note",
                hintStyle: TextStyle(color: Colors.white24)),
          ),
        ),
      ),
    );
  }
}
