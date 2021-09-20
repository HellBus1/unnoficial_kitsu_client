// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RelationshipLinksAdapter extends TypeAdapter<RelationshipLinks> {
  @override
  final int typeId = 4;

  @override
  RelationshipLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelationshipLinks(
      self: fields[0] as String,
      related: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RelationshipLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.self)
      ..writeByte(1)
      ..write(obj.related);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationshipLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
