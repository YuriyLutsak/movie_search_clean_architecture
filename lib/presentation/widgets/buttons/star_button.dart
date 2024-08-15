import 'package:flutter/material.dart';
import 'package:movie_search/data/local_storage/hive_servise.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/presentation/pages/bookmarks_page/bloc/bookmarks_bloc.dart';

class StarButton extends StatefulWidget {
  final Movie movie;
  final BookmarksBloc _bookmarksBloc = di.getIt.get();
  final HiveService _hiveService = di.getIt.get();

  StarButton({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final isFavorite = await widget._hiveService.containsMovie(widget.movie.id);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.star : Icons.star_border,
        color: _isFavorite ? Colors.yellow : Colors.grey,
      ),
      onPressed: () async {
        if (await widget._hiveService.containsMovie(widget.movie.id)) {
          setState(() {
            _isFavorite = false;
          });
          // widget._hiveService.deleteMovie(widget.movie.id); НЕ ПРАВИЛЬНО. не перерисовывает виджет
          widget._bookmarksBloc.add(RemoveFromBookmarksEvent(widget.movie.id)); // ПРАВИЛЬНО. перерисовывает виджет
        } else {
          setState(() {
            _isFavorite = true;
          });
          // widget._hiveService.addMovie(MovieHive.fromMovie(widget.movie)); НЕ ПРАВИЛЬНО
          widget._bookmarksBloc.add(AddToBookMarksEvent(
              movie: widget.movie)); // ПРАВИЛЬНО. перерисовывает виджет
        }
      },
    );
  }
}
