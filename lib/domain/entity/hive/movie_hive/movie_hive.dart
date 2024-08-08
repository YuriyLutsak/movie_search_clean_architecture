import 'package:hive/hive.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';

part 'movie_hive.g.dart';

@HiveType(typeId: 0)
class MovieHive {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final double vote_average;
  @HiveField(4)
  final String? poster_path;

  MovieHive({
    required this.id,
    required this.title,
    required this.overview,
    required this.vote_average,
    required this.poster_path,
  });

  factory MovieHive.fromMovie(Movie movie) {
    return MovieHive(id: movie.id,
      title: movie.title,
      overview: movie.overview,
      vote_average: movie.vote_average,
      poster_path: movie.poster_path,);
  }
}
