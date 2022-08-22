import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/working_hour.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/staffer/staffer_item.dart';
import 'package:flutter_app/widget/text/divider_with_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import 'controller.dart';

class DetailTab2 extends StatelessWidget {
  final controller = Get.put(DetailsTabController());

  @override
  Widget build(BuildContext context) {
    final _widgetHeight = MediaQuery.of(context).size.height;
    return Container(
      color: RColors.backgroundColor,
      child: ListView(
        children: <Widget>[
          // SalonLocationWidget(controller.business, _widgetHeight * 0.3),
          BusinessMap(controller.business),
          DividerWithText(
            text: 'Business Hours',
            marginTop: 15,
            marginBottom: 10,
          ),
          BusinessHoursWidget(
              controller.business.workingHourList, _widgetHeight * 0.1),
          DividerWithText(
            text: 'Staff',
            marginTop: 10,
            marginBottom: 4,
          ),
          Container(
            height: _widgetHeight * 0.15,
            child: _ProfessionalsList(business: controller.business),
          ),
          DividerWithText(
            text: 'Contact',
            marginTop: 10,
          ),
          ContactsWidget(
              controller.business.phoneNumbersList, _widgetHeight * 0.1)
        ],
      ),
    );
  }
}

class _ProfessionalsList extends StatelessWidget {
  final Business business;
  final DetailsTabController controller = Get.find();

  _ProfessionalsList({@required this.business});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: business.staffers.length,
      itemBuilder: (context, index) {
        var staffer = business.staffers[index];
        return StafferItem(
          staffer: staffer,
          onStafferTap: () => controller.goToPortfolio(staffer),
        );
      },
    );
  }
}

class SalonLocationWidget extends StatelessWidget {
  final Business currentSalon;
  final double widgetHeight;

  SalonLocationWidget(this.currentSalon, this.widgetHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widgetHeight,
      child: Stack(
        children: <Widget>[
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/load1.gif',
              image:
                  'https://icdn7.digitaltrends.com/image/digitaltrends/google_maps_share_location_1-500x300-c.jpg',
              height: widgetHeight,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: RColors.blackTransparentOverlay,
              width: double.infinity,
              height: widgetHeight * 0.3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    currentSalon.address,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BusinessMap extends StatelessWidget {
  final Business business;

  BusinessMap(this.business);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: IgnorePointer(
        child: GoogleMap(
          zoomControlsEnabled: false,
          compassEnabled: false,
          initialCameraPosition: CameraPosition(
            target: business.latLng,
            zoom: 15.0,
          ),
          // markers: _markers,
        ),
      ),
    );
  }
}

class BusinessHoursWidget extends StatelessWidget {
  final double widgetHeight;
  final List<WorkingHour> workingHours;

  final List<DateTime> daysOfWeek = [
    DateTime.utc(2019, 7, 1), //monday
    DateTime.utc(2019, 7, 2), //tuesday
    DateTime.utc(2019, 7, 3), //wednesday
    DateTime.utc(2019, 7, 4), //thursday
    DateTime.utc(2019, 7, 5), //friday
    DateTime.utc(2019, 7, 6), //saturday
    DateTime.utc(2019, 7, 7), //sunday
  ];

  BusinessHoursWidget(this.workingHours, this.widgetHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child:
                BusinessHourItemWidget(daysOfWeek[index], workingHours[index]),
          );
        },
      ),
    );
  }
}

class BusinessHourItemWidget extends StatelessWidget {
  final DateTime weekDay;
  final WorkingHour workingHourData;
  final DateFormat _dateFormat = DateFormat.E();
  final DateTime dateTime = DateTime.now();

  BusinessHourItemWidget(this.weekDay, this.workingHourData);

  @override
  Widget build(BuildContext context) {
    final bool _closed = workingHourData.openHour != null;
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.height * 0.032,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: RColors.primaryColor)),
          child: Center(
              child: Text(
            _dateFormat.format(weekDay),
            style: TextStyle(color: Colors.white, fontSize: 12),
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: _closed ? 8.0 : 14, bottom: 2),
          child: Text(
            _closed ? workingHourData.openHour : 'Closed',
            style: TextStyle(
                color: _closed ? Colors.white : RColors.secondaryColor,
                fontSize: 12),
          ),
        ),
        Visibility(
          visible: _closed,
          child: Text(
            _closed ? workingHourData.closeHour : '',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

//TODO write normal widget ))
class ContactsWidget extends StatelessWidget {
  final List<int> phoneNumbers;
  final double widgetHeight;

  ContactsWidget(this.phoneNumbers, this.widgetHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        height: widgetHeight,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 28,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '+374 96 88 00 77',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 28,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '+374 55 66 90 79',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
