import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/episode_attributes_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'thumbnail.dart';
import 'titles.dart';

part 'episode_attributes.g.dart';

@HiveType(
    typeId: HiveTypes.episodeAttributes,
    adapterName: HiveAdapters.episodeAttributes)
class EpisodeAttributes extends HiveObject implements ModelFactory {
  EpisodeAttributes({
    required this.createdAt,
    required this.updatedAt,
    required this.titles,
    required this.canonicalTitle,
    required this.seasonNumber,
    required this.number,
    required this.relativeNumber,
    required this.synopsis,
    required this.airdate,
    required this.length,
    required this.thumbnail,
  });

  @HiveField(EpisodeAttributesFields.createdAt)
  final DateTime createdAt;
  @HiveField(EpisodeAttributesFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(EpisodeAttributesFields.titles)
  final Titles titles;
  @HiveField(EpisodeAttributesFields.canonicalTitle)
  final String canonicalTitle;
  @HiveField(EpisodeAttributesFields.seasonNumber)
  final int seasonNumber;
  @HiveField(EpisodeAttributesFields.number)
  final int number;
  @HiveField(EpisodeAttributesFields.relativeNumber)
  final int relativeNumber;
  @HiveField(EpisodeAttributesFields.synopsis)
  final String synopsis;
  @HiveField(EpisodeAttributesFields.airdate)
  final DateTime airdate;
  @HiveField(EpisodeAttributesFields.length)
  final dynamic length;
  @HiveField(EpisodeAttributesFields.thumbnail)
  final Thumbnail thumbnail;

  factory EpisodeAttributes.fromJson(Map<String, dynamic> json) =>
      EpisodeAttributes(
        createdAt: jsonDateTimeData(json["createdAt"]),
        updatedAt: jsonDateTimeData(json["updatedAt"]),
        titles: Titles.fromJson(jsonObjectData(json["titles"], {"": ""})),
        canonicalTitle: jsonStringData(json["canonicalTitle"], ""),
        seasonNumber: jsonIntData(json["seasonNumber"], 0),
        number: jsonIntData(json["number"], 0),
        relativeNumber: jsonIntData(json["relativeNumber"], 0),
        synopsis: jsonStringData(json["synopsis"], ""),
        airdate: jsonDateTimeData(json["airdate"]),
        length: jsonIntData(json["length"], 0),
        thumbnail:
            Thumbnail.fromMap(jsonObjectData(json["thumbnail"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "titles": titles.toJson(),
        "canonicalTitle": canonicalTitle,
        "seasonNumber": seasonNumber,
        "number": number,
        "relativeNumber": relativeNumber,
        "synopsis": synopsis,
        "airdate":
            "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
        "length": length,
        "thumbnail": thumbnail.toMap(),
      };
}
