// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoverImageAdapter extends TypeAdapter<CoverImage> {
  @override
  final int typeId = 10;

  @override
  CoverImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoverImage(
      tiny: fields[0] as String,
      small: fields[1] as String,
      large: fields[2] as String,
      original: fields[3] as String,
      meta: fields[4] as Meta,
    );
  }

  @override
  void write(BinaryWriter writer, CoverImage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.tiny)
      ..writeByte(1)
      ..write(obj.small)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.original)
      ..writeByte(4)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoverImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
