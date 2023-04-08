import 'package:cloud_firestore/cloud_firestore.dart';

class Firecloud {
  static adduserdetail(
    String name,
    String email,
    int mobileno,
    int dob,
    String address,
    String rname,
    String relation,
    String rnumber,
  ) async {
    await FirebaseFirestore.instance.collection('userdetail').add({
      'Name': name,
      'email': email,
      'Mobile no': mobileno,
      'DOB': dob,
      'Address': address,
      'Relative name': rname,
      'Relation': relation,
      'Relation Phone no': rnumber,
    });
  }
}
