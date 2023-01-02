import 'package:get/get.dart';

import '../Controllers/home_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController());
  }
}
