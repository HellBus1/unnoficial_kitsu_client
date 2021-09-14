import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/local/hive/hive_types.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';

part 'user.g.dart';

@HiveType(typeId: HiveTypes.USER)
class User extends HiveObject implements ModelFactory {
  User({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
    this.picture,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? gender;
  @HiveField(4)
  String? status;
  @HiveField(5)
  String? picture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
        "picture": picture,
      };

  // @override
  // List<Object?> get props => [id, name, email, gender, status, picture];
}
