import 'package:davin_app/auth/widget/buttons.dart';
import 'package:davin_app/home/model/food_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.foodModel});
    final  FoodModel foodModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                      height: MediaQuery.of(context).size.height / 3.9,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 201, 127),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Positioned(
                          child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.arrow_back,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Order',style: TextStyle(
                                            fontSize: 18
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                        ),
                      ],
                    ),
                  ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 60),
                     child: Center(
                       child: Container(
                        height: 250,
                        width: 250,
                         child: Image.asset(
                                widget.foodModel.image
                                
                              ),
                       ),
                     ),
                   )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     widget.foodModel.name,
                     style: const TextStyle(
                     fontSize: 25,
                           fontWeight: FontWeight.bold,
                       fontFamily: 'Agbalumo',
                        ),
                        ),
                        Text(
                       '\$ ${widget.foodModel.price}',
                        style: const TextStyle(
                      fontSize: 25,
                     color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agbalumo',
                    ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Quantity',
                          style: const TextStyle(
                               fontSize: 25,
                                     fontWeight: FontWeight.bold,
                                 fontFamily: 'Agbalumo',
                                 
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            (widget.foodModel.counter<1)
                            ?widget.foodModel.counter
                            :setState((){
                              widget.foodModel.counter--;
                            });
                          }, icon: const Icon( Icons.remove,)
                          ),
                          // Text(
                          //   '${widget.foodModel.counter}',
                          //   style: const TextStyle(
                          //     fontSize: 18,

                          //   )
                          // )
                          IconButton(onPressed: () {
                            (widget.foodModel.counter<1)
                            ?widget.foodModel.counter
                            :setState((){
                              widget.foodModel.counter--;
                            });
                          }, icon: const Icon( Icons.add,)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Discription',
                          style: const TextStyle(
                               fontSize: 25,
                                     fontWeight: FontWeight.bold,
                                 fontFamily: 'Agbalumo',
                                 
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 20),
                    child: Row(
                      children: [
                        Text(
                          widget.foodModel.description,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Buttons(title: 'Booking'),
      ),
    );
  }
}
