import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/presentation/pages/home_page/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_search/presentation/widgets/buttons/star_button.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';
import 'package:movie_search/dependency_injection.dart' as di;

class HomePage extends StatelessWidget {
  final UpcomingBloc _upcomingBloc = di.getIt.get();

  @override
  Widget build(BuildContext context) {
    _upcomingBloc.add(GetUpcomingEvent()); //   ALWAYS FORGET!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text('Coming soon:'),
            SizedBox(
              height: 250, // Adjusted height to accommodate text fields
              child: BlocBuilder<UpcomingBloc, UpcomingState>(
                bloc: _upcomingBloc,
                builder: (context, state) {
                  if (state.blocStatus == BlocStatus.LOADING ||
                      state.blocStatus == BlocStatus.NONE) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.blocStatus == BlocStatus.ERROR) {
                    return Text('${state.error!} we need hive');
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var item = state.movies![index];
                      return GestureDetector(
                        child: Container(
                          width: 150,
                          // Adjusted width for better layout
                          margin: EdgeInsets.all(8),
                          // Add some margin between items
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    // Height for the image container
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            '${item!.poster_path}'),
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
                              SizedBox(height: 8),
                              // Space between image and text fields
                              Text(
                                '${item.title}',
                                // Replace with actual movie title
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Rating: ${item.vote_average}',
                                // Replace with actual movie rating
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
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
