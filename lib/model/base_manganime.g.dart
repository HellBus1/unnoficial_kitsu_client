// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_manganime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WelcomeAdapter extends TypeAdapter<BaseManganime> {
  @override
  final int typeId = 0;

  @override
  BaseManganime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseManganime(
      id: fields[0] as String,
      type: fields[1] as String,
      links: fields[2] as WelcomeLinks,
      attributes: fields[3] as Attributes,
      relationships: (fields[4] as Map).cast<String, Relationship>(),
    );
  }

  @override
  void write(BinaryWriter writer, BaseManganime obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.links)
      ..writeByte(3)
      ..write(obj.attributes)
      ..writeByte(4)
      ..write(obj.relationships);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WelcomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
