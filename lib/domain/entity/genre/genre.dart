
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  const factory Genre({required String name}) = _Genre;

  factory Genre.fromJson(Map<String, Object?> json) => _$GenreFromJson(json);
}
