import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Add user to database Function
class Firecloud {
  static adduserdetail(
    String name,
    String mobileno,
    String dob,
    String address,
    String rname,
    String relation,
    String rnumber,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await collection.doc(docSnapshot.id).update({
      'Name': name,
      'Mobile no': mobileno,
      'DOB': dob,
      'Address': address,
      'Relative name': rname,
      'Relation': relation,
      'Relation Phone no': rnumber,
    });
  }

  // Add age to Database Funtion
  static addage(String age) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .update({'Age': age});
  }

  // Add weight to Database Function
  static addweight(String weight) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .update({'Weight': weight});
  }

  // Add Physical Activity Level to Database Function
  static addphysicalactiv(String activity) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .update({'Physical Activity': activity});
  }

  // Add Gender To the database
  static selectgen(String gend) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await FirebaseFirestore.instance
        .collection('userdetail')
        .doc(docSnapshot.id)
        .set({'Gender': gend});
  }

  // Fetch Data for Current User from database
  static fetchdata() {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    collection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        collection
            .doc(result.id)
            .collection("userdetail")
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            print(
              result.data(),
            );
          });
        });
      });
    });
  }

  // Add membership Plan to data base..
  static addplandetail(
    String plan,
    String duration,
    String price,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseUser?.uid).get();
    await collection.doc(docSnapshot.id).update({
      'Plan': plan,
      'Duration': duration,
      'Price': price,
    });
  }
}
