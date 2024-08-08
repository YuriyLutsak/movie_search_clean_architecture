part of 'bookmarks_bloc.dart';

@immutable
sealed class BookmarksEvent {}

class GetBookmarksEvent extends BookmarksEvent {
}

class AddToBookMarksEvent extends BookmarksEvent {
  final Movie movie;

  AddToBookMarksEvent({required this.movie});
}

class RemoveFromBookmarksEvent extends BookmarksEvent {
  final Movie movie;

  RemoveFromBookmarksEvent({required this.movie});
}
