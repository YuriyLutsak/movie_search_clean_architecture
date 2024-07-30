import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/config/routes/routes.gr.dart';

import '../../../util/bloc_status.dart';
import '../../../util/constants.dart';
import '../../widgets/buttons/star_button.dart';
import '../home_page/bloc/upcoming/upcoming_bloc.dart';

import 'package:movie_search/dependency_injection.dart' as di;

class UpcomingMoviesList extends StatelessWidget {
  final UpcomingBloc _upcomingBloc = di.getIt.get();

  UpcomingMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _upcomingBloc.add(GetUpcomingEvent());
    return BlocBuilder<UpcomingBloc, UpcomingState>(
      bloc: _upcomingBloc,
      builder: (context, state) {
        if (state.blocStatus == BlocStatus.LOADING ||
            state.blocStatus == BlocStatus.NONE) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.blocStatus == BlocStatus.ERROR) {
          return Text('Error: ${state.error}');
        }
        if (state.movies == null || state.movies!.isEmpty) {
          return Text('No movies available');
        }
        return Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.movies!.length,
            itemBuilder: (context, index) {
              var item = state.movies![index];
              return GestureDetector(
                onTap: () {
                  context.router.push(
                    DetailRoute(filmId: item.id),
                  );
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      '$kImgPref${item.poster_path}'),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: StarButton(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${item.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Rating: ${item.vote_average}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
