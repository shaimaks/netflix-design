import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put<HomeController>(HomeController());

  var selectedIndex = 0.obs;
  int pageIndex = 1;
  bool paginationLoading = false;

  void updatePageIndex() {
    pageIndex++;
    update();
  }

  void init() {}

  Future<void> onItemTapped(int index) async {
    selectedIndex.value = index;
    if (index == 3) {}
    update();
  }
}
