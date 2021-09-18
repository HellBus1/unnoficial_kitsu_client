import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAnimeController extends GetxController {
  late ScrollController scrollController;
  late GlobalKey widgetKey;
  var opacity = (0.1).obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    // scrollController.addListener(() {

    // });
    super.onInit();
  }
}
