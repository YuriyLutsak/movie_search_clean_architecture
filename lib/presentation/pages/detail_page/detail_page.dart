import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/presentation/pages/detail_page/bloc/detail_page_bloc.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';
import 'package:movie_search/dependency_injection.dart' as di;

@RoutePage()
class DetailPage extends StatelessWidget {
  final int filmId;
  final DetailBloc _detailBloc = di.getIt.get();

  DetailPage({super.key, required this.filmId});

  @override
  Widget build(BuildContext context) {
    _detailBloc.add(GetDetailPageEvent(filmId: filmId));
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        bloc: _detailBloc,
        builder: (context, state) {
          if (state.blocStatus == BlocStatus.NONE ||
              state.blocStatus == BlocStatus.LOADING) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.blocStatus == BlocStatus.ERROR) {
            return Center(child: Text('Error: ${state.error}'));
          }
          if (state.movie == null) {
            return Center(child: Text('No movie available'));
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  '$kImgPref${state.movie!.poster_path}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    context.router.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54, // Semi-transparent black background
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Title: ${state.movie!.title}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Rating: ${state.movie!.vote_average}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Genres: ${state.movie!.genres}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Overview: ${state.movie!.overview}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
