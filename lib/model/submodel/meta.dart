import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/meta_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'dimensions.dart';

part 'meta.g.dart';

@HiveType(typeId: HiveTypes.meta, adapterName: HiveAdapters.meta)
class Meta extends HiveObject implements ModelFactory {
  Meta({
    required this.dimensions,
  });

  @HiveField(MetaFields.dimensions)
  final Dimensions dimensions;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        dimensions:
            Dimensions.fromJson(jsonObjectData(json["dimensions"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "dimensions": dimensions.toJson(),
      };
}
