import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:unnoficial_kitsu_client/model/login_result.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    if (strType == (User).toString()) {
      return User.fromJson(json);
    } else if (strType == (LoginResult).toString()) {
      return LoginResult.fromJson(json);
    } else if (strType == (BaseAnime).toString()) {
      return BaseAnime.fromJson(json);
    } else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
