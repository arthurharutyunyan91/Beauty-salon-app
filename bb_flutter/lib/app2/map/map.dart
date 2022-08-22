import 'package:flutter/material.dart';
import 'package:flutter_app/app2/map/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/widget/gradient/vertical_gradient.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widget/business_item/business_item.dart';

class MapPage extends StatefulWidget {
  final List<Business> businessList;

  MapPage({this.businessList});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  MapScreenController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MapScreenController(widget.businessList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapScreenController>(builder: (_) {
        return Stack(
          children: <Widget>[
            GoogleMap(
              compassEnabled: false,
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(40.730610, -73.935242),
                zoom: 0.0,
              ),
              markers: controller.markers.toSet(),
            ),
            SelectedBusiness(),
            IgnorePointer(
                child: VerticalGradient(
              stops: [0.0, 0.15],
            )),
            _AppBar(),
          ],
        );
      }),
    );
  }
}

class _AppBar extends StatelessWidget {
  final MapScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.my_location,
                size: 30,
              ),
              onPressed: () {
                controller.animateToLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedBusiness extends StatelessWidget {
  final MapScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return controller.selectedBusiness != null
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: BusinessWidget(
                  business: controller.selectedBusiness,
                  onTap: () {
                    //TODO
                  },
                ),
              ),
            ),
          )
        : Container();
  }
}
