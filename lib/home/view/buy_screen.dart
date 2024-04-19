
import 'package:davin_app/home/view/account_editscreen.dart';
import 'package:davin_app/home/view/favorite_screen.dart';
import 'package:davin_app/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Buy extends StatelessWidget {
  const Buy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
  gap: 8,
  tabs: [
    GButton(
      icon: Icons.home,
      text: 'Home',
      onPressed: ()async{
        Get.to(HomeScreen());
      },
    ),
    GButton(
      icon: Icons.favorite_border,
      text: 'Like',
      onPressed: ()async{
        Get.to(Favorite());
      },
    ),
    GButton(
      icon: Icons.add_shopping_cart,
      text: 'Buy',
      onPressed: ()async{
        Get.to(Buy());
      },
    ),
    GButton(
      icon: Icons.person,
      text: 'Profile',
      onPressed: () async {
        Get.to(Profile());
      },
    ),
  ],
),

    );
  }
}