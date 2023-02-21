import 'package:get/get.dart';

class FavoritesController extends GetxController {
  RxList<String> fruitlist = ['Apple', 'Bannana', ' Orange', "keenu"].obs;
  RxList tempFruitlist = [].obs;

  addtoFavorites(String value) {
    tempFruitlist.add(value);
  }

  removefromFavorites(String value) {
    tempFruitlist.remove(value); 
  }
}
