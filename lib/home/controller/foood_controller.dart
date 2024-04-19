import 'package:davin_app/home/model/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:davin_app/home/model/profile_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  CollectionReference food =
      FirebaseFirestore.instance.collection('User');
  Future<void> addProfile(ProfileModel model) {
    return food
        .add(model.fromJSon())
        .then((value) => print("Added"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> deleteProfile({required String id}) {
    return food
        .doc(id)
        .delete()
        .then((value) => print(" Deleted"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> updateProfile(
      {required ProfileModel model, required String id}) {
    return food
        .doc(id)
        .update(model.fromJSon())
        .then((value) => print(" Updated"))
        .catchError((error) => print("Failed : $error"));
  }
}