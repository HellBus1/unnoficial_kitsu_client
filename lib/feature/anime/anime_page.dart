import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/base_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_page_list.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/header_image.dart';
import 'package:unnoficial_kitsu_client/utills/widget/colored_status_bar.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';
import 'package:sizer/sizer.dart';

class AnimePage extends StatelessWidget {
  // final BaseAnimeController baseAnimeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseAnimeController>(builder: (controller) {
      return ColoredStatusBar(
        color: Colors.black.withOpacity(0.2),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black.withOpacity(0.2),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "txt_tv_shows".tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text("txt_movies".tr,
                            style: Theme.of(context).textTheme.bodyText1)),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "txt_category".tr,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ))
                  ]),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: Container(
              child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: HeaderImage(),
                ),
                Container(
                    padding: EdgeInsets.all(10.sp), child: AnimePageList())
              ])),
            ],
          )),
        ),
      );
    });
  }
}
