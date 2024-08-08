import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_search/config/routes/routes.gr.dart';

import '../../../domain/entity/movie/movie.dart';
import '../../../util/constants.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailRoute(filmId: movie.id));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 150.0, // Устанавливаем желаемую высоту изображения
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '$kImgPref${movie.poster_path}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title),
                  SizedBox(height: 4.0),
                  Text('Рейтинг: ${movie.vote_average}'),
                  SizedBox(height: 4.0),
                  Text('Жанры: ${movie.genres?.join(', ')}'),
                  SizedBox(height: 4.0),
                  Text(movie.overview,
                      maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
