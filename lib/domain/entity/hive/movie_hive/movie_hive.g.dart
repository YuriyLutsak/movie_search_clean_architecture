// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHiveAdapter extends TypeAdapter<MovieHive> {
  @override
  final int typeId = 0;

  @override
  MovieHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHive(
      id: fields[0] as int,
      title: fields[1] as String,
      overview: fields[2] as String,
      vote_average: fields[3] as double,
      poster_path: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.vote_average)
      ..writeByte(4)
      ..write(obj.poster_path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
