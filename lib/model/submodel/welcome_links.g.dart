// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WelcomeLinksAdapter extends TypeAdapter<WelcomeLinks> {
  @override
  final int typeId = 1;

  @override
  WelcomeLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WelcomeLinks(
      self: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WelcomeLinks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.self);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WelcomeLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
