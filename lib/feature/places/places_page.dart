import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/places/widgets/place_list_builder.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';
import 'places_controller.dart';

class PlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'txt_menu_home'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: GetBuilder<PlaceController>(
            builder: (controller) {
              return StateHandleWidget(
                loadingEnabled: controller.isShimmering,
                emptyEnabled: controller.isEmptyData,
                emptySubtitle: 'txt_empty_user'.tr,
                errorEnabled: controller.isError,
                errorText: 'txt_error_general'.tr,
                onRetryPressed: () {
                  controller.refreshPage();
                },
                body: ListPlacebuilder(controller),
              );
            },
          ),
        ),
      ),
    );
  }
}
