import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:davin_app/auth/controller/user_controller.dart';
import 'package:davin_app/auth/model/user_model.dart';
import 'package:davin_app/home/controller/foood_controller.dart';
import 'package:davin_app/home/model/profile_model.dart';
import 'package:davin_app/widget/tixt_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profilescreen extends StatelessWidget {
   Profilescreen({super.key,});

final currentUser=FirebaseAuth.instance.currentUser;

final userController = Get.put(UserController());



final foodController =Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                 Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.9,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 201, 127),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                  ),
                ],
              ),
              
            ],
            
          ),
        ),
      ),
    );
  }
}