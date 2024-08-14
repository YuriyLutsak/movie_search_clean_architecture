import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_search/config/routes/routes.gr.dart';
import 'package:movie_search/presentation/pages/widget/top_rate_movie_list.dart';

import '../widget/upcoming_movie_list.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Coming soon:'),
            ),
            UpcomingMoviesList(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Top Rated:'),
            ),
            TopRateMovieList(),
          ],
        ),
      ),
    );
  }
}
