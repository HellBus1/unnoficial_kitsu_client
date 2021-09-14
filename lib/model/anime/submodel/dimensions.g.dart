// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DimensionsAdapter extends TypeAdapter<Dimensions> {
  @override
  final int typeId = 9;

  @override
  Dimensions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dimensions(
      tiny: fields[0] as Large,
      small: fields[1] as Large,
      large: fields[2] as Large,
      medium: fields[3] as Large,
    );
  }

  @override
  void write(BinaryWriter writer, Dimensions obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tiny)
      ..writeByte(1)
      ..write(obj.small)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.medium);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DimensionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
