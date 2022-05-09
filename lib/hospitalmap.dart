import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/hospitalservices.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'hospitalprofile.dart';

class Hmap extends StatefulWidget {
  // final ServiceDataModel serviceDataModel;
  final HospitalModel hm;

  Hmap({Key? key, required this.hm}) : super(key: key);

  @override
  State<Hmap> createState() => _HmapState();
}

class _HmapState extends State<Hmap> {
  late GoogleMapController controller;

  Set<Marker> _markers = Set<Marker>();

  LatLng currentLocation = LatLng(5.6037, -0.1870);

  LatLng destinationLocation = LatLng(5.6040, -0.1872);

  double CAMERA_ZOOM = 16;
  double CAMERA_TILT = 80;
  double CAMERA_BEARING = 30;

  CameraPosition initialCameraPosition = CameraPosition(
      bearing: 30, target: LatLng(5.6037, -0.1870), tilt: 80, zoom: 16);
  @override
  void initState() {
    super.initState();
    this.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Location"),
      ),
      body: Column(
        children: [
          // Text(
          //   'Select Worker Location',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          // ),
          Expanded(
            child: GoogleMap(
                myLocationButtonEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                markers: _markers,
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController gcontroller) {
                  setState(() {
                    controller = gcontroller;

                    showPinsOnMap();
                  });
                }),
          ),
        ],
      ),
    );
  }

  void showPinsOnMap() {
    // for (int index = 0;
    // index < widget.serviceDataModel.workers.length;
    // index++)// {
    _markers.add(Marker(
        markerId: MarkerId(widget.hm.id),
        position: widget.hm.location,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HospitalProfile(
                        hm: widget.hm,
                      )));
        }));
    //  }
  }

  // worker: widget.serviceDataModel.workers[index],

  Future<void> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    setState(() {
      currentLocation =
          LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0);
    });
    controller.animateCamera(CameraUpdate.newLatLng(currentLocation));
  }
}
