import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;
  RxBool notification = false.obs;

  incrementCounter() {
    counter.value++;
  }

  setNotificaton( bool value) {
    notification.value = value;
  }
}
