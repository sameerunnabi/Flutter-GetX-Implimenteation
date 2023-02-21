import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project/counter/counter_controller.dart';
import 'package:project/counter/counter_screen.dart';
import 'package:project/login/login_screen.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Get X"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("Dialog Box With Getx"),
              subtitle: Text("Getx Dialog alert"),
              onTap: () {
                Get.defaultDialog(
                    contentPadding: EdgeInsets.all(30),
                    titlePadding: EdgeInsets.only(top: 20),
                    title: "delete chat",
                    middleText: "Are you sure you want to delete this chat ?",
                    cancel: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancle")),
                    confirm: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("confirm")));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Theme Change"),
              subtitle: Text("theme change from getx"),
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(Icons.light_mode),
                          title: Text("Light Theme"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          }),
                      ListTile(
                        leading: Icon(Icons.dark_mode),
                        title: Text("Dark Theme"),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                      ),
                    ],
                  ),
                ));
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.2,
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
                      // Get.to(ScreenOne());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CounterScreen()));
                    },
                    child: Text("Go to Counter Screen")),
              ),
            ),
          ),
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
                      Get.to(LoginScreen());
                    },
                    child: Text("Go to Login Screen")),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar("Greetings", "welcome customer",
            backgroundColor: Colors.amber,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.add));
      }),
    );
  }
}
