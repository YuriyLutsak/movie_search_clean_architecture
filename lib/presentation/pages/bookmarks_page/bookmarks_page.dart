import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/config/routes/routes.gr.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/presentation/pages/bookmarks_page/bloc/bookmarks_bloc.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';

@RoutePage()
class BookmarksPage extends StatelessWidget {
  final BookmarksBloc _bookmarksBloc = di.getIt.get();

  @override
  Widget build(BuildContext context) {
    _bookmarksBloc.add(GetBookmarksEvent());
    return Scaffold(
      body: BlocBuilder<BookmarksBloc, BookmarksState>(
        bloc: _bookmarksBloc,
        builder: (context, state) {
          if (state.blocStatus == BlocStatus.LOADING ||
              state.blocStatus == BlocStatus.NONE) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.blocStatus == BlocStatus.ERROR) {
            return Text('Ошибка: ${state.error}');
          }
          if (state.movies == null || state.movies!.isEmpty) {
            return Text('Нет доступных фильмов');
          }
          return ListView.builder(
            itemCount: state.movies!.length,
            itemBuilder: (context, index) {
              var movie = state.movies![index];
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
                        height: 150.0,
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

              //MovieListItem(movie: item);
            },
          );
        },
      ),
    );
  }
}
