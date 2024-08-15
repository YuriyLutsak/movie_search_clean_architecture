import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/config/routes/routes.gr.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:movie_search/presentation/widgets/buttons/star_button.dart';
import 'package:movie_search/util/bloc_status.dart';
import 'package:movie_search/util/constants.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  final SearchBloc _searchBloc = di.getIt.get();
  final TextEditingController _searchController = TextEditingController();

  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Responsive TextField
            SizedBox(
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

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image with Star button
                              Expanded(
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.router
                                            .push(DetailRoute(filmId: item.id));
                                      },
                                      child: Image.network(
                                        '$kImgPref$poster',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey,
                                            child: Icon(Icons.error,
                                                color: Colors.red),
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                        top: 8.0,
                                        right: 8.0,
                                        child: StarButton(movie: item)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.title),
                                    SizedBox(height: 8.0),
                                    Text(
                                      item.overview,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Rating: ${item.vote_average}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
