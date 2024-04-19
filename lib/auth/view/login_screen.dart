import 'package:davin_app/auth/controller/user_controller.dart';
import 'package:davin_app/auth/model/user_model.dart';
import 'package:davin_app/auth/view/regiser_screen.dart';
import 'package:davin_app/auth/widget/buttons.dart';
import 'package:davin_app/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final controller = Get.put(UserController());
  RxBool check = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child:  Column(
            children: [
              const SizedBox(height: 100,),
              const Text('EAT WITH ME',
              style: TextStyle(
                fontSize: 28,
                color: Colors.orange ,
                fontFamily: 'Agbalumo'
                ),),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 10),
                  child: Row(
                    
                    children: [
                      Text('SIGN IN',style: TextStyle(fontFamily: 'Poppins',fontSize: 20,color: Colors.orange),)
                    ],
                  ),
                  
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputField(
                    controller: email, 
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.person),
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                  () => InputField(
                    controller: password,
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        check.value = !check.value;
                      },
                      icon: Icon(
                        (check.value == false)
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: check.value,
                  ),
                              ),
                ),
                const SizedBox(height: 50,),
                 GestureDetector(
                onTap: () async {
                  await controller.loginUser(
                    UserModel(
                      email: email.text,
                      password: password.text.trim(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Visibility(
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      visible: controller.check.value,
                      child:  Buttons(
                        title: 'Login',
                      ),
                    ),
                  ),
                ),
              ),
                const SizedBox(height: 20,),
                const Text(
                  'Forget Password',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 20,),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold
                      ),),
                     const SizedBox(height: 20,),
                     const Text(
                      'New to EATWITHME?',
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                     ),
                     const SizedBox(height: 10,),
                     GestureDetector(
                      onTap: () async => Get.to(RegisterScreen()),

                       child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontFamily:'Poppins',color: Colors.orange ),
                       ),
                     ),
                     
            ],
          ),
        ),
      ),
    );
  }
}