// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributesAdapter extends TypeAdapter<Attributes> {
  @override
  final int typeId = 11;

  @override
  Attributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attributes(
      createdAt: fields[0] as DateTime,
      updatedAt: fields[1] as DateTime,
      slug: fields[2] as String,
      synopsis: fields[3] as String,
      description: fields[4] as String,
      coverImageTopOffset: fields[5] as int,
      titles: fields[6] as Titles,
      canonicalTitle: fields[7] as String,
      abbreviatedTitles: (fields[8] as List).cast<dynamic>(),
      averageRating: fields[9] as String,
      ratingFrequencies: (fields[10] as Map).cast<String, String>(),
      userCount: fields[11] as int,
      favoritesCount: fields[12] as int,
      startDate: fields[13] as DateTime,
      endDate: fields[14] as DateTime,
      popularityRank: fields[16] as int,
      ratingRank: fields[17] as int,
      ageRating: fields[18] as String,
      ageRatingGuide: fields[19] as String,
      subtype: fields[20] as String,
      status: fields[21] as String,
      tba: fields[22] as String,
      posterImage: fields[23] as PosterImage,
      coverImage: fields[24] as CoverImage,
      episodeCount: fields[25] as int,
      episodeLength: fields[26] as int,
      totalLength: fields[27] as int,
      youtubeVideoId: fields[28] as String,
      showType: fields[29] as String,
      nsfw: fields[30] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Attributes obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.synopsis)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.coverImageTopOffset)
      ..writeByte(6)
      ..write(obj.titles)
      ..writeByte(7)
      ..write(obj.canonicalTitle)
      ..writeByte(8)
      ..write(obj.abbreviatedTitles)
      ..writeByte(9)
      ..write(obj.averageRating)
      ..writeByte(10)
      ..write(obj.ratingFrequencies)
      ..writeByte(11)
      ..write(obj.userCount)
      ..writeByte(12)
      ..write(obj.favoritesCount)
      ..writeByte(13)
      ..write(obj.startDate)
      ..writeByte(14)
      ..write(obj.endDate)
      ..writeByte(16)
      ..write(obj.popularityRank)
      ..writeByte(17)
      ..write(obj.ratingRank)
      ..writeByte(18)
      ..write(obj.ageRating)
      ..writeByte(19)
      ..write(obj.ageRatingGuide)
      ..writeByte(20)
      ..write(obj.subtype)
      ..writeByte(21)
      ..write(obj.status)
      ..writeByte(22)
      ..write(obj.tba)
      ..writeByte(23)
      ..write(obj.posterImage)
      ..writeByte(24)
      ..write(obj.coverImage)
      ..writeByte(25)
      ..write(obj.episodeCount)
      ..writeByte(26)
      ..write(obj.episodeLength)
      ..writeByte(27)
      ..write(obj.totalLength)
      ..writeByte(28)
      ..write(obj.youtubeVideoId)
      ..writeByte(29)
      ..write(obj.showType)
      ..writeByte(30)
      ..write(obj.nsfw);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
