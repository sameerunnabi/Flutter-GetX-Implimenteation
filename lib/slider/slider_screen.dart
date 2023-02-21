import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/counter/switch.dart';
import 'package:project/slider/opacity_controller.dart';

import '../home_screen.dart';

class sliderScreen extends StatefulWidget {
  const sliderScreen({super.key});

  @override
  State<sliderScreen> createState() => _sliderScreenState();
}

class _sliderScreenState extends State<sliderScreen> {
  final OpacityController opacitycontroller = Get.put(OpacityController());

  @override
  void setState(VoidCallback) {
    // TODO: implement setState
    super.setState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Slider With GET X"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                    color: Colors.tealAccent
                        .withOpacity(opacitycontroller.opacity.value),
                    borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.2,
                width: Get.width * 0.5,
              ),
            ),
            Obx(
              () => Slider(
                  value: opacitycontroller.opacity.value,
                  onChanged: (value) {
                    opacitycontroller.setOpacity(value);
                  }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Get.to(TextSwitch());
                      // Get.back();
                    },
                    child: Text("Go To Notification Screen")),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: Text("Go to Home Screen"),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
