import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void LoginApi() async {
    loading.value = true;
    try {
      final response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      });

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar("Login Successfull", "Congratulations!",
            backgroundColor: Colors.green);
      } else {
        loading.value = false;
        Get.snackbar("Login Unseccesfull", data['error'],
            backgroundColor: Colors.red);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        "Exception",
        e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
