import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorData {
  String? name;
  String? address;
  String? concentration;
  int? phone;
  String? photoUrl;

  DoctorData({
    this.name,
    this.address,
    this.concentration,
    this.phone,
    this.photoUrl,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
        name: json["nama"],
        address: json['alamat'],
        concentration: json['konsentrasi'],
        phone: json['telepon'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() => {
        "nama": name,
        "alamat": address,
        "konsentrasi": concentration,
        "phone": phone,
        "photo": photoUrl,
      };

  factory DoctorData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DoctorData(
      name: data?['nama'],
      address: data?['alamat'],
      concentration: data?['konsentrasi'],
      phone: data?['telepon'],
      photoUrl: data?['photoUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "nama": name,
      if (address != null) "alamat": address,
      if (concentration != null) "konsentrasi": concentration,
      if (phone != null) "telepon": phone,
      if (photoUrl != null) "photoUrl": photoUrl,
    };
  }
}
