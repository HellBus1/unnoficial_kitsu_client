import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/welcome_links_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

part 'welcome_links.g.dart';

@HiveType(
    typeId: HiveTypes.welcomeLinks, adapterName: HiveAdapters.welcomeLinks)
class WelcomeLinks extends HiveObject implements ModelFactory {
  WelcomeLinks({
    required this.self,
  });

  @HiveField(WelcomeLinksFields.self)
  final String self;

  factory WelcomeLinks.fromJson(Map<String, dynamic> json) => WelcomeLinks(
        self: jsonStringData(json["self"], ""),
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
