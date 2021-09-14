import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/places/detail/place_detail_controller.dart';

class PlaceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceDetailController>(
        () => PlaceDetailController(id: Get.arguments));
  }
}
