import 'package:davin_app/auth/controller/user_controller.dart';
import 'package:davin_app/auth/model/user_model.dart';
import 'package:davin_app/auth/view/login_screen.dart';
import 'package:davin_app/auth/widget/buttons.dart';
import 'package:davin_app/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) ;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cf_password = TextEditingController();
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 100),
              const Text(
                'EAT WITH ME',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.orange,
                  fontFamily: 'Agbalumo',
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputField(
                  controller: email,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.person),
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputField(
                  controller: password,
                  hintText: 'Enter  password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputField(
                  controller: cf_password,
                  hintText: 'Enter confirm password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  if (password.text.trim() == cf_password.text.trim()) {
                    await controller.createUser(
                      UserModel(
                        email: email.text,
                        password: password.text.trim(),
                      ),
                    );
                  } else {
                    print('error');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Visibility(
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      visible: controller.check.value,
                      child: Buttons(
                        title: 'Create Account',
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Already have an account!! ',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => Get.to(LoginScreen()),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(fontFamily: 'Poppins', color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
