import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project/home_screen.dart';
import 'package:project/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("LOGIN With GET X"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.25,
              ),
              TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextFormField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      controller.LoginApi();
                    },
                    child: controller.loading.value
                        ? CircularProgressIndicator()
                        : Container(
                            height: 45,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Center(child: Text("LOGIN")),
                          ),
                  )),
              SizedBox(
                height: Get.height * 0.25,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        child: Text("Go to Home Screen")),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
