import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_search/domain/entity/genre/genre.dart';
import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie(
      {required int id,
      required String title,
      required String overview,
      required double vote_average,
      required String? poster_path,
      List<Genre>? genres}) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);

  factory Movie.fromMovieHive(MovieHive movieHive) => Movie(
        id: movieHive.id,
        title: movieHive.title,
        overview: movieHive.overview,
        vote_average: movieHive.vote_average,
        poster_path: movieHive.poster_path,
      );
}
