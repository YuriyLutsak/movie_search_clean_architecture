import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/domain/entity/genre/genre.dart';
import 'package:movie_search/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';
import '../../widgets/movie_tile.dart';
//
// void main() {
//   di.setup();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Search Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SearchPage(),
//     );
//   }
// }


@RoutePage()
class SearchPage extends StatelessWidget {
  final SearchBloc _searchBloc = di.getIt.get();
  final TextEditingController _searchController = TextEditingController();

  String? query;

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // Define your breakpoint here

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Responsive TextField
            SizedBox(
              width: isWideScreen ? screenWidth * 0.5 : double.infinity,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  label: Text('search'),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      query = '';
                    },
                  ),
                ),
                onChanged: (input) {
                  query = input;
                },
                onSubmitted: (input) {
                  _searchBloc.add(GetSearchEvent(input));
                },
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                bloc: _searchBloc,
                builder: (context, state) {
                  if (state.blocStatus == BlocStatus.NONE ||
                      state.blocStatus == BlocStatus.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.blocStatus == BlocStatus.ERROR) {
                    return Center(
                      child: Text('${state.error}: error in search page'),
                    );
                  }
                  if (state.blocStatus == BlocStatus.LOADED &&
                      state.movies != null) {
                    return ListView.builder(
                      itemCount: state.movies!.length,
                      itemBuilder: (context, index) {
                        var item = state.movies![index];
                        var poster = item.poster_path ?? '';
                        return MovieTile(
                          title: item.title,
                          genres: item.genres,
                          overview: item.overview,
                          poster: '$kImgPref$poster',
                          rating: item.vote_average,
                        );
                      },
                    );
                  }
                  return Center(child: Text('No results found'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
