part of 'detail_page_bloc.dart';

@immutable
sealed class DetailEvent {}

class GetDetailPageEvent implements DetailEvent {
  final int filmId;

  GetDetailPageEvent({required this.filmId});
}
