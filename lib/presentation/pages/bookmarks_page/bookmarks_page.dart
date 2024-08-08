import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/presentation/pages/bookmarks_page/bloc/bookmarks_bloc.dart';
import 'package:movie_search/util/bloc_status.dart';

import '../widget/movie_list_item.dart';

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
              var item = state.movies![index];
              return MovieListItem(movie: item);
            },
          );
        },
      ),
    );
  }
}
