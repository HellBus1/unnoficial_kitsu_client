import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_object_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';

class AnimeDetailController extends BaseObjectController<BaseManganime> {
  AnimeDetailController({String? id}) : super(id: id);

  Future<void> getAnimeDetail() async {
    loadingState();
    await client.then(
      (value) =>
          value.getAnimeDetail(int.parse(id!)).validateStatus().then((data) {
        setData(data.result!);
      }).handleError((error) {
        finishLoadData(errorMessage: error.toString());
        debugPrint(error.toString());
      }),
    );
  }
}
