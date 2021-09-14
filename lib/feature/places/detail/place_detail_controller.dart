import 'package:flutter/cupertino.dart';
import 'package:unnoficial_kitsu_client/data/local/hive/hive_constants.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_object_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';

class PlaceDetailController extends BaseObjectController<Place> {
  PlaceDetailController({String? id}) : super(id: id);

  @override
  void onInit() {
    getCacheBox(HiveConstants.PLACES).then((value) => getPlaceDetail());
    super.onInit();
  }

  Future<void> getPlaceDetail() async {
    loadingState();
    await client.then(
      (value) =>
          value.getPlaceDetail(int.parse(id!)).validateStatus().then((data) {
        saveCacheBoxAndFinish(data.result);
      }).handleError((error) {
        finishLoadData(errorMessage: error.toString());
        debugPrint(error.toString());
      }),
    );
  }
}
