// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_attributes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeAttributesAdapter extends TypeAdapter<EpisodeAttributes> {
  @override
  final int typeId = 13;

  @override
  EpisodeAttributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeAttributes(
      createdAt: fields[0] as DateTime,
      updatedAt: fields[1] as DateTime,
      titles: fields[2] as Titles,
      canonicalTitle: fields[3] as String,
      seasonNumber: fields[4] as int,
      number: fields[5] as int,
      relativeNumber: fields[6] as int,
      synopsis: fields[7] as String,
      airdate: fields[8] as DateTime,
      length: fields[9] as dynamic,
      thumbnail: fields[10] as Thumbnail,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeAttributes obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.titles)
      ..writeByte(3)
      ..write(obj.canonicalTitle)
      ..writeByte(4)
      ..write(obj.seasonNumber)
      ..writeByte(5)
      ..write(obj.number)
      ..writeByte(6)
      ..write(obj.relativeNumber)
      ..writeByte(7)
      ..write(obj.synopsis)
      ..writeByte(8)
      ..write(obj.airdate)
      ..writeByte(9)
      ..write(obj.length)
      ..writeByte(10)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeAttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
