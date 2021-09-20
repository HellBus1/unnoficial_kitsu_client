import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/large_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

part 'large.g.dart';

@HiveType(typeId: HiveTypes.large, adapterName: HiveAdapters.large)
class Large extends HiveObject implements ModelFactory {
  Large({
    required this.width,
    required this.height,
  });

  @HiveField(LargeFields.width)
  final int width;
  @HiveField(LargeFields.height)
  final int height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        width: jsonIntData(json["width"], 0),
        height: jsonIntData(json["height"], 0),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}
