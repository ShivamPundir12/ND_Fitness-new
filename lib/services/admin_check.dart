
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nd_fitness/services/secure_storage.dart';

class AdminCheck {
 final firebase = FirebaseAuth.instance;
 final secureStorage = secure_storage();
 adminSignIn(emailController, passwordController) async{
  UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.trim(),
              password: passwordController.trim());
      await secureStorage.writeSecureData(
          'email', userCredential.user!.email.toString());
      secureStorage.writeSecureData(
          'name', userCredential.user!.displayName.toString())
    .then((userCredential) => {
      // Check if user is admin
        user = userCredential.user;
      if (user && user.email === 'admin@example.com') {
        console.log('Admin user signed in:', user.email);
        // Redirect to admin dashboard or perform admin actions
      } else {
        console.error('User is not authorized to access the admin portal');
      }
    })
    .catch((error) => {
      console.error('Error signing in:', error);
    });
}

}