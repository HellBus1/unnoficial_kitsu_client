import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/detail/controller/anime_detail_controller.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';

class AnimeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimeDetailController>(
        init: AnimeDetailController(id: Get.arguments.toString()),
        builder: (controller) {
          return StateHandleWidget(body: Container());
        });
  }
}
