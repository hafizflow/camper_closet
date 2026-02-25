// closet_tab_controller.dart
import 'package:get/get.dart';

class ClosetTabController extends GetxController {
  final RxInt selectedTab = 0.obs;
  void changeTab(int i) => selectedTab.value = i;
}