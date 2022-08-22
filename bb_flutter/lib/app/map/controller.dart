import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/business.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {
  final List<Business> businesses;
  Business selectedBusiness;
  var markers = <Marker>[];

  GoogleMapController _mapController;
  BitmapDescriptor _selectedMarkerIcon;
  BitmapDescriptor _unselectedMarkerIcon;
  int _previousSelectedMarkerIndex = 0;

  MapScreenController(this.businesses) {
    _initIcons();
    animateToLocation();
  }

  onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  animateToLocation() {
    _getCurrentLocation().then((position) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15.0),
        ),
      );
    });
  }

  _initIcons() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(100, 100)),
            'assets/images/location_yellow.png')
        .then((value) {
      _selectedMarkerIcon = value;
    });
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(100, 100)),
            'assets/images/location_black.png')
        .then((value) {
      _unselectedMarkerIcon = value;
    });
    _initMarkers();
  }

  _initMarkers() {
    for (int i = 0; i < businesses.length; i++) {
      var business = businesses[i];
      markers.add(
        Marker(
            icon: _unselectedMarkerIcon,
            position: business.latLng,
            markerId: MarkerId(
              business.latLng.toString(),
            ),
            onTap: () {
              selectedBusiness = business;
              _onMarkerTap(i);
            }),
      );
    }
    update();
  }

  Future<Position> _getCurrentLocation() async {
    var currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  _onMarkerTap(int selectedIndex) {
    Marker selectedMarker =
        markers[selectedIndex].copyWith(iconParam: _selectedMarkerIcon);
    markers.removeAt(selectedIndex);
    markers.insert(selectedIndex, selectedMarker);

    Marker unselectedMarker = markers[_previousSelectedMarkerIndex]
        .copyWith(iconParam: _unselectedMarkerIcon);
    markers.removeAt(_previousSelectedMarkerIndex);
    markers.insert(_previousSelectedMarkerIndex, unselectedMarker);
    _previousSelectedMarkerIndex = selectedIndex;
    update();
  }
}
