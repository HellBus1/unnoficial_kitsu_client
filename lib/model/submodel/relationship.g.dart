// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RelationshipAdapter extends TypeAdapter<Relationship> {
  @override
  final int typeId = 3;

  @override
  Relationship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Relationship(
      links: fields[0] as RelationshipLinks,
    );
  }

  @override
  void write(BinaryWriter writer, Relationship obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
