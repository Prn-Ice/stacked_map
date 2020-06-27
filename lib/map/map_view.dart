import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

import '../core/app/locator.dart';
import '../core/services/bottom_nav_bar/bottom_nav_bar_service.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final BottomNavBarService _bottomNavBarService =
      locator<BottomNavBarService>();

  @override
  Widget build(BuildContext context) {
    Logger().i('Building Map');
    final googleMap = GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          0.0,
          0.0,
        ),
      ),
      onMapCreated: (ctr) {
        print('Created');
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
    );

    return Obx(
      () => _bottomNavBarService.index == 0 ? googleMap : Container(),
    );
  }
}
