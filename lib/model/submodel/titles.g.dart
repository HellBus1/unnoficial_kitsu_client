// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TitlesAdapter extends TypeAdapter<Titles> {
  @override
  final int typeId = 2;

  @override
  Titles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Titles(
      en: fields[0] as String,
      enJp: fields[1] as String,
      jaJp: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Titles obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.enJp)
      ..writeByte(2)
      ..write(obj.jaJp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitlesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
