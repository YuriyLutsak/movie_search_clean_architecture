import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/presentation/pages/home_page/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_search/presentation/widgets/buttons/star_button.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';

class HomePage extends StatelessWidget {
  final UpcomingBloc _upcomingBloc = di.getIt.get<UpcomingBloc>();

  @override
  Widget build(BuildContext context) {
    _upcomingBloc.add(GetUpcomingEvent());

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text('Coming soon:'),
            SizedBox(
              height: 250,
              child: BlocBuilder<UpcomingBloc, UpcomingState>(
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies!.length,
                    itemBuilder: (context, index) {
                      var item = state.movies![index];
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          width: 180,
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
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
                              Expanded(
                                child: Column(
                                  children: [
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
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
