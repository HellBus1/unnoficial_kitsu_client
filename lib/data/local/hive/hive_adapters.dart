import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';

class HiveAdapters {
  void registerAdapter() {
    Hive.registerAdapter<User>(UserAdapter());
    Hive.registerAdapter<Place>(PlaceAdapter());
  }
}
