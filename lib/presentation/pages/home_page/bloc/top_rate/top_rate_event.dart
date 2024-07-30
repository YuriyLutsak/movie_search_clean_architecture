part of 'top_rate_bloc.dart';

@immutable
sealed class TopRateEvent {}

class GetTopRateEvent extends TopRateEvent{}