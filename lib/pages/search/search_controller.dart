import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hopewell/common/entities/doctor.dart';
import 'package:hopewell/pages/search/bloc/search_bloc.dart';

class SearchControllers {
  final BuildContext context;
  SearchControllers({required this.context});
  Map<String, dynamic> location = {};

  void init() async {
    print("Search controller initializing..");
    // var position = await determinePosition();
    // location['latitude'] = position.latitude;
    // location['longitude'] = position.longitude;
    // print(location);
    await determinePosition().then((value) {
      location['latitude'] = value.latitude;
      location['longitude'] = value.longitude;
    });

    getDoctorList();
  }

  void getDoctorList() async {
    List<DoctorData> doctorList = [];
    var document = await FirebaseFirestore.instance.collection('doctor').get();
    // document.data()!['url'].forEach((element) {});
    var doc = document.docs;
    for (var doctor in doc) {
      doctorList.add(DoctorData.fromFirestore(doctor, SnapshotOptions()));
    }
    print("List Dokter ${doctorList.first.toJson()}");
    context.read<SearchBloc>().add(SearchPageDoctorData(doctorList));
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
