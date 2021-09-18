import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';

class HiveAdapters {
  void registerAdapter() {
    Hive.registerAdapter<User>(UserAdapter());
  }
}
