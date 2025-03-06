// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UniversityModelAdapter extends TypeAdapter<UniversityModel> {
  @override
  final int typeId = 0;

  @override
  UniversityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UniversityModel(
      id: fields[0] as String,
      name: fields[1] as String,
      courses: (fields[2] as List).cast<CourseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UniversityModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
