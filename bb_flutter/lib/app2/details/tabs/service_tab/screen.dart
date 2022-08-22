import 'package:flutter/material.dart';
import 'package:flutter_app/app2/details/tabs/service_tab/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:get/get.dart';

class ServicesTab2 extends StatelessWidget {
  final serviceTabController = Get.put(ServiceTabController());

  @override
  Widget build(BuildContext context) {
    return _ServiceList(business: serviceTabController.business);
  }
}

class _ServiceList extends StatelessWidget {
  final ServiceTabController controller = Get.find();
  final Business business;

  _ServiceList({
    @required this.business,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (context, index) {
        var currentService = business.serviceList[index];
        return _ServicePrice(
            serviceData: currentService,
            onTap: () => controller.goToPickStaff(currentService));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.white30,
          ),
        );
      },
    );
  }
}

class _ServicePrice extends StatelessWidget {
  final Service serviceData;
  final Function() onTap;

  _ServicePrice({this.onTap, @required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${serviceData.serviceName}',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    '${serviceData.servicePrice}\$',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
                MaterialButton(
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 8,
                  color: RColors.curvedBarColor,
                  onPressed: onTap,
                  child: Text(
                    'Book',
                    style: TextStyle(color: RColors.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
