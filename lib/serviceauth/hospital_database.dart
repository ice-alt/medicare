import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_handymappisioma/hospitalservices.dart';

Future<Map<String, List<String>>> getSymptoms() async {
  Map<String, List<String>> symptons = {};

  FirebaseDatabase database = FirebaseDatabase.instance;

  DataSnapshot ref = await database.ref("symptoms").get();

  for (DataSnapshot data in ref.children) {
    Map<String, List<String>> map = data.value as Map<String, List<String>>;
    symptons.addAll(map);
  }

  return symptons;
}

Future<List<HospitalModel>> getHospitals() async {
  List<HospitalModel> hospitals = [];

  FirebaseDatabase database = FirebaseDatabase.instance;

  DataSnapshot ref = await database.ref("hospitals").get();

  for (DataSnapshot data in ref.children) {
    Map<String, dynamic> map = data.value as Map<String, dynamic>;
    hospitals.add(HospitalModel(
        id: data.ref.path,
        phoneNumber: map["number"],
        location: map["location"]));
  }

  return hospitals;
}
