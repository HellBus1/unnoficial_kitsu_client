// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PosterImageAdapter extends TypeAdapter<PosterImage> {
  @override
  final int typeId = 5;

  @override
  PosterImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PosterImage(
      tiny: fields[0] as String,
      small: fields[1] as String,
      medium: fields[2] as String,
      large: fields[3] as String,
      original: fields[4] as String,
      meta: fields[5] as Meta,
    );
  }

  @override
  void write(BinaryWriter writer, PosterImage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.tiny)
      ..writeByte(1)
      ..write(obj.small)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.large)
      ..writeByte(4)
      ..write(obj.original)
      ..writeByte(5)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosterImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
