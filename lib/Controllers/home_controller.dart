import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  static DateTime get now => DateTime.now();
  String formatedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  var datetimeFormated = ''.obs;

  @override
  void onInit() {
    datetimeFormated.value = formatedDate.toString();
    super.onInit();
  }
}
