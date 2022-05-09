import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalModel {
  String id;
  String phoneNumber;
  LatLng location;

  HospitalModel(
      {required this.id, required this.phoneNumber, required this.location});
}
