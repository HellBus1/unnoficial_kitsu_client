// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThumbnailAdapter extends TypeAdapter<Thumbnail> {
  @override
  final int typeId = 17;

  @override
  Thumbnail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thumbnail(
      original: fields[0] as String,
      meta: fields[1] as Meta,
    );
  }

  @override
  void write(BinaryWriter writer, Thumbnail obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
