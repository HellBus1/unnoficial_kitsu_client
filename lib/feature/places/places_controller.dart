import 'package:flutter/cupertino.dart';
import 'package:unnoficial_kitsu_client/data/local/hive/hive_constants.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';

class PlaceController extends BaseListController<Place> {
  @override
  void onInit() {
    getCacheBox(HiveConstants.PLACES).then((value) => getPlaces());
    super.onInit();
  }

  @override
  void refreshPage() {
    getPlaces();
  }

  @override
  void loadNextPage() {
    getPlaces(page: page++);
  }

  Future<void> getPlaces({int page = 1}) async {
    loadingState();
    await client.then(
      (value) => value.getPlaces(page, perPage).validateStatus().then((data) {
        hasNext = data.data!.isNotEmpty;
        print(data);
        if (page == 1) {
          dataList.clear();
          saveCache(data.data, idList: data.data?.map((e) => e.id.toString()));
        }
        setFinishCallbacks(data.data!);
      }).handleError((onError) {
        finishLoadData(errorMessage: onError.toString());
        debugPrint("error : " + onError.toString());
      }),
    );
  }

  // void saveCache(List<User>? datas) {
  //   if (datas != null && datas.isNotEmpty) {
  //     // var dataManager = LocalStorageManager();
  //     // dataManager.write(StorageName.USERS, dataManager.encodeList<User>(datas));
  //     //HiveHelper<User>().box.delete('users');
  //     HiveHelper<User>().saveList('users', datas);
  //   }
  // }

  // List<User> getUserCache() {
  //   // var dataManager = LocalStorageManager();
  //   // Iterable l = json.decode(dataManager.get(StorageName.USERS));
  //   // List<User>? users = List<User>.from(
  //   //     l.map((model) => User.fromJson(model))); // decode json to list
  //   //User user = User.fromJson(jsonDecode(dataManager.get(StorageName.USERS))); // decode json to object
  //   List<User>? users = HiveHelper<User>().getList('users');

  //   return (users != null && users.isNotEmpty) ? users : [];
  // }
}
