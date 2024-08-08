import 'package:get_it/get_it.dart';
import 'package:movie_search/data/local_storage/hive_servise.dart';
import 'package:movie_search/data/remote_storage/detail_service.dart';
import 'package:movie_search/data/remote_storage/search_service.dart';
import 'package:movie_search/data/remote_storage/top_rate_service.dart';
import 'package:movie_search/data/remote_storage/upcaming_service.dart';
import 'package:movie_search/data/repo/detail_repo.dart';
import 'package:movie_search/data/repo/movie_hive_repo.dart';
import 'package:movie_search/data/repo/search_repo.dart';
import 'package:movie_search/data/repo/top_rate_repo.dart';
import 'package:movie_search/domain/repo/i_detail_repo.dart';
import 'package:movie_search/domain/repo/i_search_repo.dart';
import 'package:movie_search/domain/repo/i_upcoming_repo.dart';
import 'package:movie_search/domain/usecase/detail_usecase.dart';
import 'package:movie_search/domain/usecase/hive_usecases/get_stored_usecase.dart';
import 'package:movie_search/domain/usecase/search_usecase.dart';
import 'package:movie_search/domain/usecase/top_rate_usecase.dart';
import 'package:movie_search/domain/usecase/upcoming_usecase.dart';
import 'package:movie_search/presentation/pages/detail_page/bloc/detail_page_bloc.dart';
import 'package:movie_search/presentation/pages/home_page/bloc/top_rate/top_rate_bloc.dart';
import 'package:movie_search/presentation/pages/home_page/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_search/presentation/pages/search_page/bloc/search_bloc.dart';

import 'data/repo/upcoming_repo.dart';
import 'domain/repo/i_movie_hive_repo.dart';
import 'domain/repo/i_top_rate_repo.dart';
import 'domain/usecase/hive_usecases/add_stored_usecase.dart';
import 'domain/usecase/hive_usecases/delete_stored_usecase.dart';
import 'presentation/pages/bookmarks_page/bloc/bookmarks_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
//SERVICES
    ..registerLazySingleton<UpcomingService>(() => UpcomingService())
    ..registerLazySingleton<TopRateService>(() => TopRateService())
    ..registerLazySingleton<SearchService>(() => SearchService())
    ..registerLazySingleton<DetailService>(() => DetailService())
    ..registerLazySingleton<HiveService>(() => HiveService())
//REPOSITORIES
    ..registerLazySingleton<IUpcomingRepo>(() => UpcomingRepo(getIt.get()))
    ..registerLazySingleton<ITopRateRepo>(() => TopRateRepo(getIt.get()))
    ..registerLazySingleton<ISearchRepo>(() => SearchRepo(getIt.get()))
    ..registerLazySingleton<IDetailRepo>(() => DetailRepo(getIt.get()))
    ..registerLazySingleton<IMovieHiveRepo>(() => MovieHiveRepo(getIt.get()))
//USECASES
    ..registerLazySingleton<IUpcomingUsecase>(
        () => UpcomingUsecase(getIt.get()))
    ..registerLazySingleton<ITopRateUsecase>(() => TopRateUsecase(getIt.get()))
    ..registerLazySingleton<ISearchUsecase>(() => SearchUsecase(getIt.get()))
    ..registerLazySingleton<IDetailUsecase>(() => DetailUsecase(getIt.get()))
    ..registerLazySingleton<IGetStoredUsecase>(
        () => GetStoredUsecase(getIt.get()))
    ..registerLazySingleton<IDeleteStorageUsecase>(
        () => DeleteStorageUsecase(getIt.get()))
    ..registerLazySingleton<IAddStorageUsecase>(
        () => AddStorageUsecase(getIt.get()))

//BLOCS
    ..registerLazySingleton<UpcomingBloc>(() => UpcomingBloc(getIt.get()))
    ..registerLazySingleton<TopRateBloc>(() => TopRateBloc(getIt.get()))
    ..registerLazySingleton<SearchBloc>(() => SearchBloc(getIt.get()))
    ..registerLazySingleton<DetailBloc>(() => DetailBloc(getIt.get()))
    ..registerLazySingleton<BookmarksBloc>(() => BookmarksBloc());
}
