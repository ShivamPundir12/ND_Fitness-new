import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firecloud {
  static adduserdetail(
    String name,
    String email,
    String mobileno,
    String dob,
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

  static addage(String age) async {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc('doc_id2').get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .set({'Age': age});
  }

  static addweight(String weight) async {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc('doc_id').get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .set({'Weight': weight});
  }
}
