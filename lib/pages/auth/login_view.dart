import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller/login_controller.dart';
import 'package:food_delivery/models/login_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginView extends StatelessWidget {
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailText,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Email/Phone',
                hintText: 'Enter Your Register Email',
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordText,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'Enter Your Password',
              ),
            ),
            GestureDetector(
              onTap: () {
               login();

              },
              child: TextButton(
                onPressed: () {
                  // callLoginApi();
                },
                child: Text(
                  'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

   login() {
    var authController=Get.find()<LoginController>();
    LoginModel loginModel=LoginModel(email:emailText.text,password:passwordText.text);
    authController.login(loginModel).then((status){
      if(status.success){
        print("Login success");
      }
      else{
        print("Login failed");
      }
    });


   }
}
