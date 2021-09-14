import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/places/detail/widgets/place_detail_content.dart';
import 'package:unnoficial_kitsu_client/utills/widget/colored_status_bar.dart';
import 'package:unnoficial_kitsu_client/utills/widget/loading_overlay.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';
import 'package:unnoficial_kitsu_client/utills/widget/statefull_wrapper.dart';

import 'place_detail_controller.dart';

class PlaceDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageStatic = "https://picsum.photos/200/300";

    return StatefulWrapper(
      onInit: () {
        print("on Init");
      },
      child: ColoredStatusBar(
        child: Scaffold(
          appBar: AppBar(
            title: Text('txt_menu_detail'.tr),
          ),
          body: GetBuilder<PlaceDetailController>(
            init: PlaceDetailController(id: Get.arguments.toString()),
            builder: (controller) => StateHandleWidget(
              shimmerView: LoadingOverlay(),
              typeList: false,
              loadingEnabled: controller.isShimmering,
              onRetryPressed: () {
                controller.getPlaceDetail();
              },
              errorEnabled: controller.isError,
              errorText: 'txt_error_general'.tr,
              emptyEnabled: controller.isEmptyData,
              emptySubtitle: 'txt_empty_user'.tr,
              body: PlaceDetailContent(
                  imageStatic: imageStatic, place: controller.mData),
            ),
          ),
        ),
      ),
    );
  }
}
