import 'package:crud/data/services/movie/movie_service.dart';
import 'package:crud/data/services/movie/movie_service_impl.dart';
import 'package:crud/data/services/web_api/web_api.dart';
import 'package:crud/data/services/web_api/web_api_impl.dart';
import 'package:crud/viewmodel/movie_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  serviceLocator.registerLazySingleton<MovieService>(() => MovieServiceImp());

  serviceLocator.registerFactory<MovieViewModel>(() => MovieViewModel());
}
