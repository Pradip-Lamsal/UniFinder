// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultancy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConsultancyModelAdapter extends TypeAdapter<ConsultancyModel> {
  @override
  final int typeId = 2;

  @override
  ConsultancyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConsultancyModel(
      id: fields[0] as String,
      name: fields[1] as String,
      details: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ConsultancyModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsultancyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
