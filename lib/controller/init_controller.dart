import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
Future<void> init() async {
  Get.lazyPut(() => ListController());
}
