import 'package:digitalk_flutter_test_task/core/network/network_info.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/datasource/characters_datasource.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/repository/character_repo_impl.dart';
import 'package:digitalk_flutter_test_task/features/characters/domain/repository/characters_repo.dart';
import 'package:digitalk_flutter_test_task/features/characters/domain/usecase/get_characters_usecase.dart';
import 'package:digitalk_flutter_test_task/features/characters/ui/characters_screen/bloc/characters_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //
  //Bloc
  sl.registerFactory(() => CharactersBloc(sl()));

  //
  // usecase
  sl.registerLazySingleton(() => GetCharactersUsecase(sl()));

  //
  //repo
  sl.registerLazySingleton<CharactersRepo>(
    () => CharactersRepoImpl(sl(), sl()),
  );

  //
  //data source
  sl.registerLazySingleton<CharactersDatasource>(() => CharactersDatasourceImpl(sl()));

  //
  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //
  // ====
  sl.registerLazySingleton(() => http.Client());
}
