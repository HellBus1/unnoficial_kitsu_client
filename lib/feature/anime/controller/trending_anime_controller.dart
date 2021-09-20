import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:get/get.dart';

class TrendingAnimeController extends BaseListController<BaseManganime> {
  @override
  void onInit() {
    getTrendingAnime();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // page = page + 5;
    // getTrendingAnime(offset: page);
  }

  @override
  void refreshPage() {
    getTrendingAnime();
  }

  Future<void> getTrendingAnime({int offset = 0}) async {
    loadingState();
    await client.then(
      (RestClient restClient) =>
          restClient.getTrendingAnime(20, offset).validateStatus().then((data) {
        hasNext = data.data!.isNotEmpty;

        dataList.clear();
        addData(data.data!);

        setFinishCallbacks(data.data!);
      }).handleError((onError) {
        finishLoadData(errorMessage: onError.toString());
        debugPrint("error : " + onError.toString());
      }),
    );
  }
}
