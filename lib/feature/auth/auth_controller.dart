import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/data/local/storage/storage_constants.dart';
import 'package:unnoficial_kitsu_client/data/local/storage/storage_manager.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';
import 'package:unnoficial_kitsu_client/routes/page_names.dart';
import 'package:unnoficial_kitsu_client/utills/helper/secure_storage_manager.dart';
import 'package:unnoficial_kitsu_client/utills/helper/shared_preference_manager.dart';

import 'auth_state.dart';

class AuthController extends GetxController {
  static AuthController find = Get.find();
  Rxn<AuthState> authState = Rxn<AuthState>();

  Stream<AuthState?> get stream => authState.stream;
  AuthState? get state => authState.value;

  var storage = StorageManager();
  var secureStorage = SecureStorageManager();

  User? get user {
    if (storage.has(StorageName.USERS)) {
      return User.fromJson(storage.get(StorageName.USERS));
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    authState.value = AuthState(appStatus: AppType.INITIAL);
    super.onInit();
  }

  @override
  void onReady() async {
    ever(authState, authChanged);
    authChanged(state);
    super.onReady();
  }

  authChanged(AuthState? state) async {
    if (state?.appStatus == AppType.INITIAL) {
      await setup();
      checkUser();
    } else if (state?.appStatus == AppType.UNAUTHENTICATED) {
      clearData();
      Get.offAllNamed(PageName.LOGIN);
    } else if (state?.appStatus == AppType.AUTHENTICATED) {
      Get.offAllNamed(PageName.DASHBOARD);
    } else {
      Get.toNamed(PageName.LOADER);
    }
    update();
  }

  void checkUser() {
    if (storage.has(StorageName.USERS)) {
      setAuth();
    } else {
      signOut();
    }
  }

  void clearData() {
    if (storage.has(StorageName.USERS)) {
      storage.delete(StorageName.USERS);
    }
  }

  Future<void> saveAuthData({required User user, required String token}) async {
    storage.write(StorageName.USERS, user.toJson());
    await secureStorage.setToken(value: token);
  }

  Future<void> signOut() async {
    await secureStorage.setToken(value: '');
    authState.value = AuthState(appStatus: AppType.UNAUTHENTICATED);
  }

  void setAuth() {
    authState.value = AuthState(appStatus: AppType.AUTHENTICATED);
  }

  setup() async {
    var _sp = SharedPreferenceManager();
    final firstInstall = _sp.getIsFirstInstall();
    if (firstInstall) {
      await secureStorage.setToken(value: '');
      _sp.setIsFirstInstall(value: false);
    }
  }
}
