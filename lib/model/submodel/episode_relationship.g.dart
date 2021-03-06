// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_relationship.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeRelationshipAdapter extends TypeAdapter<EpisodeRelationship> {
  @override
  final int typeId = 14;

  @override
  EpisodeRelationship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeRelationship(
      media: fields[0] as Media,
      videos: fields[1] as Media,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeRelationship obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.media)
      ..writeByte(1)
      ..write(obj.videos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeRelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
