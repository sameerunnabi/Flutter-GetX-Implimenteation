import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/counter/counter_controller.dart';
import 'package:project/favorites/favorite_screen.dart';

class TextSwitch extends StatefulWidget {
  const TextSwitch({super.key});

  @override
  State<TextSwitch> createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch> {
  CounterController switchcountroller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Notification Example"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification of Facebook"),
                  Obx(
                    () => Switch(
                        value: switchcountroller.notification.value,
                        onChanged: ((value) {
                          switchcountroller.setNotificaton(value);
                        })),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        Get.to(FavoriteScreen());
                      },
                      child: Text("Go To Favorite Screen")),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        child: Text("Go To home Screen")),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
