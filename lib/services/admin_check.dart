import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAuth {
  // Function to check if user is an admin
  Future<void> checkAdmin(
      String emailcontrollter, String passwordcontroller) async {
    try {
      // Query the 'admin_users' collection for user with matching email and password
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin_users')
          .where('email', isEqualTo: emailcontrollter)
          .where('password', isEqualTo: passwordcontroller)
          .get();
      // Check if there is exactly 1 user with matching email and password
      if (querySnapshot.docs.length == 1) {
        // Get the data of the user with matching email and password
        var userData = querySnapshot.docs[0].data() as Map<String, dynamic>;

        // Check if the user has admin Access
        if (userData['isAdmin']) {
          print('User is an admin');
        } else {
          print('User is not an admin');
        }
      } else {
        print('User not found or multiple users found');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
