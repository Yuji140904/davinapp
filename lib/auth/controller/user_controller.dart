import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:davin_app/auth/model/user_model.dart';
import 'package:davin_app/auth/view/login_screen.dart';
import 'package:davin_app/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool check = true.obs;

  Future<void> createUser(UserModel model) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      await FirebaseFirestore.instance
          .collection("User")
          .doc(userCredential.user!.email)
          .set({
        'username': model.email!.split('@')[0], // Corrected emailTextController to model.email
      });

      if (userCredential.user != null) {
        Get.offAll(HomeScreen());
        Get.snackbar('Success', 'Account created successfully');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      } else {
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future<void> loginUser(UserModel model) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      check.value = false;
      // Removed unnecessary delayed function call

      if (userCredential.user != null) {
        Get.offAll(HomeScreen());
        Get.snackbar('Success', 'Account login success');
      }
      check(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else {
        Get.snackbar('Error', 'Something went wrong');
      }
    }

    update();
  }

  Future<void> onCheckUser() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(LoginScreen());
      } else {
        Get.offAll(HomeScreen());
      }
    });
    update();
  }

  Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
