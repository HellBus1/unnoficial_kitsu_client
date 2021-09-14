import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/attributes_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'cover_image.dart';
import 'poster_image.dart';
import 'titles.dart';

part 'attributes.g.dart';

@HiveType(typeId: HiveTypes.attributes, adapterName: HiveAdapters.attributes)
class Attributes extends HiveObject implements ModelFactory {
  Attributes({
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.synopsis,
    required this.description,
    required this.coverImageTopOffset,
    required this.titles,
    required this.canonicalTitle,
    required this.abbreviatedTitles,
    required this.averageRating,
    required this.ratingFrequencies,
    required this.userCount,
    required this.favoritesCount,
    required this.startDate,
    required this.endDate,
    required this.popularityRank,
    required this.ratingRank,
    required this.ageRating,
    required this.ageRatingGuide,
    required this.subtype,
    required this.status,
    required this.tba,
    required this.posterImage,
    required this.coverImage,
    required this.episodeCount,
    required this.episodeLength,
    required this.totalLength,
    required this.youtubeVideoId,
    required this.showType,
    required this.nsfw,
  });

  @HiveField(AttributesFields.createdAt)
  final DateTime createdAt;
  @HiveField(AttributesFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(AttributesFields.slug)
  final String slug;
  @HiveField(AttributesFields.synopsis)
  final String synopsis;
  @HiveField(AttributesFields.description)
  final String description;
  @HiveField(AttributesFields.coverImageTopOffset)
  final int coverImageTopOffset;
  @HiveField(AttributesFields.titles)
  final Titles titles;
  @HiveField(AttributesFields.canonicalTitle)
  final String canonicalTitle;
  @HiveField(AttributesFields.abbreviatedTitles)
  final List<dynamic> abbreviatedTitles;
  @HiveField(AttributesFields.averageRating)
  final String averageRating;
  @HiveField(AttributesFields.ratingFrequencies)
  final Map<String, String> ratingFrequencies;
  @HiveField(AttributesFields.userCount)
  final int userCount;
  @HiveField(AttributesFields.favoritesCount)
  final int favoritesCount;
  @HiveField(AttributesFields.startDate)
  final DateTime startDate;
  @HiveField(AttributesFields.endDate)
  final DateTime endDate;
  @HiveField(AttributesFields.popularityRank)
  final int popularityRank;
  @HiveField(AttributesFields.ratingRank)
  final int ratingRank;
  @HiveField(AttributesFields.ageRating)
  final String ageRating;
  @HiveField(AttributesFields.ageRatingGuide)
  final String ageRatingGuide;
  @HiveField(AttributesFields.subtype)
  final String subtype;
  @HiveField(AttributesFields.status)
  final String status;
  @HiveField(AttributesFields.tba)
  final String tba;
  @HiveField(AttributesFields.posterImage)
  final PosterImage posterImage;
  @HiveField(AttributesFields.coverImage)
  final CoverImage coverImage;
  @HiveField(AttributesFields.episodeCount)
  final int episodeCount;
  @HiveField(AttributesFields.episodeLength)
  final int episodeLength;
  @HiveField(AttributesFields.totalLength)
  final int totalLength;
  @HiveField(AttributesFields.youtubeVideoId)
  final String youtubeVideoId;
  @HiveField(AttributesFields.showType)
  final String showType;
  @HiveField(AttributesFields.nsfw)
  final bool nsfw;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: jsonDateTimeData(json["createdAt"]),
        updatedAt: jsonDateTimeData(json["updatedAt"]),
        slug: jsonStringData(json["slug"], ""),
        synopsis: jsonStringData(json["synopsis"], ""),
        description: jsonStringData(json["description"], ""),
        coverImageTopOffset: jsonIntData(json["coverImageTopOffset"], 0),
        titles: Titles.fromJson(jsonObjectData(json["titles"], {"": ""})),
        canonicalTitle: jsonStringData(json["canonicalTitle"], ""),
        abbreviatedTitles: jsonList(json["abbreviatedTitles"]),
        averageRating: jsonStringData(json["averageRating"], ""),
        ratingFrequencies: jsonMapData(Map.from(json["ratingFrequencies"])
            .map((k, v) => MapEntry<String, String>(k, v))),
        userCount: jsonIntData(json["userCount"], 0),
        favoritesCount: jsonIntData(json["favoritesCount"], 0),
        startDate: jsonDateTimeData(json["startDate"]),
        endDate: jsonDateTimeData(json["endDate"]),
        popularityRank: jsonIntData(json["popularityRank"], 0),
        ratingRank: jsonIntData(json["ratingRank"], 0),
        ageRating: jsonStringData(json["ageRating"], ""),
        ageRatingGuide: jsonStringData(json["ageRatingGuide"], ""),
        subtype: jsonStringData(json["subtype"], ""),
        status: jsonStringData(json["status"], ""),
        tba: jsonStringData(json["tba"], ""),
        posterImage:
            PosterImage.fromJson(jsonObjectData(json["posterImage"], {"": ""})),
        coverImage:
            CoverImage.fromJson(jsonObjectData(json["coverImage"], {"": ""})),
        episodeCount: jsonIntData(json["episodeCount"], 0),
        episodeLength: jsonIntData(json["episodeLength"], 0),
        totalLength: jsonIntData(json["totalLength"], 0),
        youtubeVideoId: jsonStringData(json["youtubeVideoId"], ""),
        showType: jsonStringData(json["showType"], ""),
        nsfw: jsonBoolData(json["nsfw"], false),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
        "synopsis": synopsis,
        "description": description,
        "coverImageTopOffset": coverImageTopOffset,
        "titles": titles.toJson(),
        "canonicalTitle": canonicalTitle,
        "abbreviatedTitles":
            List<dynamic>.from(abbreviatedTitles.map((x) => x)),
        "averageRating": averageRating,
        "ratingFrequencies": Map.from(ratingFrequencies)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "userCount": userCount,
        "favoritesCount": favoritesCount,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "popularityRank": popularityRank,
        "ratingRank": ratingRank,
        "ageRating": ageRating,
        "ageRatingGuide": ageRatingGuide,
        "subtype": subtype,
        "status": status,
        "tba": tba,
        "posterImage": posterImage.toJson(),
        "coverImage": coverImage.toJson(),
        "episodeCount": episodeCount,
        "episodeLength": episodeLength,
        "totalLength": totalLength,
        "youtubeVideoId": youtubeVideoId,
        "showType": showType,
        "nsfw": nsfw,
      };
}
