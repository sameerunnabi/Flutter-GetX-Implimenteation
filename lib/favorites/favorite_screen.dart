import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/favorites/favorites.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoritesController favoritesController = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite With GET X"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoritesController.fruitlist.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      if (favoritesController.tempFruitlist.contains(
                          favoritesController.fruitlist[index].toString())) {
                        favoritesController.removefromFavorites(
                            favoritesController.fruitlist[index].toString());
                      } else {
                        favoritesController.addtoFavorites(
                            favoritesController.fruitlist[index].toString());
                      }
                    },
                    title:
                        Text(favoritesController.fruitlist[index].toString()),
                    trailing: Obx(
                      () => Icon(
                        Icons.favorite,
                        color: favoritesController.tempFruitlist.contains(
                                favoritesController.fruitlist[index].toString())
                            ? Colors.red
                            : Colors.grey[200],
                      ),
                    ),
                  );
                })),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    // Get.to(FavoriteScreen());
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Go To Home Screen")),
            ),
          )
        ],
      ),
    );
  }
}
