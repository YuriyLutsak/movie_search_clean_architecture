part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchEvent implements SearchEvent {
  final String query;

  GetSearchEvent(this.query);
}
