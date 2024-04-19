import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
   MyTextBox({super.key,
   required this.image, required this.sectionname,required this.onPressed
   });
  final String image;
  final String sectionname;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.only(left: 15,bottom: 15),
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(sectionname,style: TextStyle(color: Colors.grey),),
              IconButton(onPressed: () {
              },
              icon: Icon(Icons.edit,color: Colors.grey,),
            )
            ],

          ),
          Text(image)
        ],
      ),
    );
  }
}