import 'package:carousel_slider/carousel_slider.dart';
import 'package:davin_app/home/model/food_model.dart';
import 'package:davin_app/home/view/account_editscreen.dart';
import 'package:davin_app/home/view/buy_screen.dart';
import 'package:davin_app/home/view/detail_screen.dart';
import 'package:davin_app/home/view/favorite_screen.dart';
import 'package:davin_app/home/view/profile_screen.dart';
import 'package:davin_app/widget/food_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(270),
                    ),
                  ),
                  child: ListView(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'EAT WITH ME',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: CarouselSlider(
                      items: List.generate(listFood.length, (index) {
                        return Container(
                          width: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            foodModel: listFood[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Container(
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                left: 170,
                                              ),
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 120,
                                          child: Center(
                                            child: SimpleShadow(
                                              child: Image.asset(
                                                listFood[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                listFood[index].name,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Agbalumo',
                                                ),
                                              ),
                                              Text(
                                                listFood[index].description,
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Agbalumo',
                                                ),
                                              ),
                                              Text(
                                                '\$ ${listFood[index].price}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Agbalumo',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Container(
                                          child: const Padding(
                                            padding: EdgeInsets.only(left: 100),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      options: CarouselOptions(
                        height: 270,
                        viewportFraction: 0.6,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(seconds: 4),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'POPULAR FOOD',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: SizedBox(
                      child: GridView.builder(
                        itemCount: listFood.length,
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 2.8,
                        ),
                        itemBuilder: (context, index) =>
                            foodOrder(context, listFood[index]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
