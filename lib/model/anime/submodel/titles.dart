import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/titles_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

part 'titles.g.dart';

@HiveType(typeId: HiveTypes.titles, adapterName: HiveAdapters.titles)
class Titles extends HiveObject implements ModelFactory {
  Titles({
    required this.en,
    required this.enJp,
    required this.jaJp,
  });

  @HiveField(TitlesFields.en)
  final String en;
  @HiveField(TitlesFields.enJp)
  final String enJp;
  @HiveField(TitlesFields.jaJp)
  final String jaJp;

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
        en: jsonStringData(json["en"], ""),
        enJp: jsonStringData(json["en_jp"], ""),
        jaJp: jsonStringData(json["ja_jp"], ""),
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "en_jp": enJp,
        "ja_jp": jaJp,
      };
}
