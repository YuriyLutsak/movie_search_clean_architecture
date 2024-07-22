import 'package:get_it/get_it.dart';
import 'package:movie_search/data/remote_storage/upcaming_service.dart';
import 'package:movie_search/domain/repo/i_upcoming_repo.dart';
import 'package:movie_search/domain/usecase/upcoming_usecase.dart';
import 'package:movie_search/presentation/pages/home_page/bloc/upcoming/upcoming_bloc.dart';

import 'data/repo/upcoming_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
//SERVICES
    ..registerLazySingleton<UpcomingService>(() => UpcomingService())
//REPOSITORIES
    ..registerLazySingleton<IUpcomingRepo>(() => UpcomingRepo(getIt.get()))
//USECASES
    ..registerLazySingleton<IUpcomingUsecase>(
        () => UpcomingUsecase(getIt.get()))
//BLOCS
    ..registerLazySingleton<UpcomingBloc>(() => UpcomingBloc(getIt.get()));
}
