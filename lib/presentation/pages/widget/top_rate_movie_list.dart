import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/config/routes/routes.gr.dart';
import 'package:movie_search/config/theme/white.dart';
import 'package:movie_search/data/local_storage/hive_servise.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';

import '../../widgets/buttons/star_button.dart';
import '../home_page/bloc/top_rate/top_rate_bloc.dart';

class TopRateMovieList extends StatelessWidget {
  final TopRateBloc _topRateBloc = di.getIt.get();
  final HiveService hiveService = di.getIt.get();


  TopRateMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;

    _topRateBloc.add(GetTopRateEvent());
    return BlocBuilder<TopRateBloc, TopRateState>(
      bloc: _topRateBloc,
      builder: (context, state) {
        if (state.blocStatus == BlocStatus.NONE ||
            state.blocStatus == BlocStatus.LOADING) {
          return CircularProgressIndicator();
        }
        if (state.blocStatus == BlocStatus.ERROR) {
          return Text('${state.error}');
        }
        if (state.movies == null || state.movies!.isEmpty) {
          return Text('No avilable movies');
        }
        return ListView.builder(
            shrinkWrap: true,
            // подстраивает ListView под размер содержимого
            physics: const NeverScrollableScrollPhysics(),
            // ListView не будет прокручиваться.
            itemCount: 10,
            itemBuilder: (context, index) {
              var item = state.movies![index];
              return GestureDetector(
                onTap: () {
                  context.router.push(
                    DetailRoute(filmId: item.id),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      // Image section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 150,
                          height: 250, // Fixed height for the image
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
                                right: 0.1,
                                top: 0.1,
                                child: StarButton(
                                  // onPress: () {},
                                  movie: item,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      // Text section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.title}',
                              style: textTheme.titleLarge,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Rating: ${item.vote_average}',
                              style: textTheme.titleMedium,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Rating: ${item.overview}',
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
