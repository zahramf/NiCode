// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PathAdapter extends TypeAdapter<Path> {
  @override
  final int typeId = 0;

  @override
  Path read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Path()..choose = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Path obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.choose);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PathAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
