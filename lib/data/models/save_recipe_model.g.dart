// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeHiveModelAdapter extends TypeAdapter<RecipeHiveModel> {
  @override
  final int typeId = 0;

  @override
  RecipeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeHiveModel(
      uri: fields[0] as String,
      label: fields[1] as String,
      image: fields[2] as String,
      source: fields[3] as String,
      url: fields[4] as String,
      calories: fields[5] as int,
      totalWeight: fields[6] as double,
      ingredientLines: (fields[7] as List).cast<String>(),
      healthLabels: (fields[8] as List).cast<String>(),
      ingredients: (fields[9] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      totalTime: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.source)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.calories)
      ..writeByte(6)
      ..write(obj.totalWeight)
      ..writeByte(7)
      ..write(obj.ingredientLines)
      ..writeByte(8)
      ..write(obj.healthLabels)
      ..writeByte(9)
      ..write(obj.ingredients)
      ..writeByte(10)
      ..write(obj.totalTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
