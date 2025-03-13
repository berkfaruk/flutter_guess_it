import 'package:dio/dio.dart';
import 'package:flutter_guess_it/core/failure/failure.dart';
import 'package:flutter_guess_it/core/model/either.dart';
import 'package:flutter_guess_it/features/game/data/datasource/game_remote_data_source.dart';
import 'package:flutter_guess_it/features/game/domain/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource gameRemoteDataSource;

  GameRepositoryImpl({required this.gameRemoteDataSource});

  @override
  Future<Either<Failure, void>> checkWord(String word) async {
    try {
      var result = await gameRemoteDataSource.checkWord(word);
      return Right(null);
    } on DioException catch (e) {
      return Left(GameFailure(message: 'Please, enter correct word'));
    } catch (e) {
      return Left(GameFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getRandomWord(int length) async {
    try {
      var result = await gameRemoteDataSource.getRandomWord(length);
      try {
        await gameRemoteDataSource.checkWord(result);
      } catch (e) {
        return getRandomWord(length);
      }
      return Right(result);
    } catch (e) {
      return Left(GameFailure(message: 'Error'));
    }
  }
}
