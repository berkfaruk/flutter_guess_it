import 'package:flutter_guess_it/core/api/dio_client.dart';
import 'package:flutter_guess_it/features/game/data/datasource/game_remote_data_source.dart';
import 'package:flutter_guess_it/features/game/data/repository/game_repository_impl.dart';
import 'package:flutter_guess_it/features/game/domain/game_repository.dart';
import 'package:flutter_guess_it/features/game/presentation/bloc/game_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setup() {
  registerDataSources();
  registerRepositories();
  registerBloc();
}

void registerDataSources() {
  getIt.registerSingleton(GameRemoteDataSource(dio: DioClient.getDio()));
}

void registerRepositories() {
  getIt.registerSingleton<GameRepository>(
      GameRepositoryImpl(gameRemoteDataSource: getIt()));
}

void registerBloc() {
  getIt.registerFactory<GameBloc>(() => GameBloc(gameRepository: getIt()));
}
