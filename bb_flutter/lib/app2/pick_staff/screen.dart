import 'package:flutter/material.dart';
import 'package:flutter_app/app2/pick_staff/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/text/divider_with_text.dart';
import 'package:get/get.dart';

class PickStaffScreen extends StatelessWidget {
  final Business business;
  final Service service;

  PickStaffScreen({@required this.business, @required this.service});

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    Get.put(PickStaffController(business, service));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          service.serviceName,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: RColors.backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: RColors.backgroundColor,
      body: Column(
        children: <Widget>[
          DividerWithText(
            marginTop: _query.height * 0.03,
            marginBottom: _query.height * 0.01,
            text: 'Pick a Staff',
          ),
          Expanded(
            child: StaffList(business: business, service: service),
          ),
        ],
      ),
    );
  }
}

class StaffList extends StatelessWidget {
  final PickStaffController controller = Get.find();
  final Business business;
  final Service service;

  StaffList({@required this.business, @required this.service});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: business.staffers.length,
      itemBuilder: (context, index) {
        var staffer = business.staffers[index];
        return _BookStaffWidget(
          staffer: staffer,
          business: business,
          onStafferTap: () => controller.goToPortfolio(staffer),
          onBookTap: () => controller.goToMakeAppointment(staffer),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.white12,
          ),
        );
      },
    );
  }
}

class _BookStaffWidget extends StatelessWidget {
  final Staffer staffer;
  final Business business;
  final Function() onStafferTap;
  final Function() onBookTap;

  _BookStaffWidget({
    @required this.staffer,
    @required this.business,
    @required this.onStafferTap,
    @required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.002, horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: onStafferTap,
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: staffer.imageUrl.hashCode + staffer.name.hashCode,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/load1.gif',
                          image: staffer.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      '${staffer.name}',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 8,
              color: RColors.curvedBarColor,
              onPressed: onBookTap,
              child: Text(
                'Book',
                style: TextStyle(color: RColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
