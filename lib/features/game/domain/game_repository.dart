import 'package:flutter_guess_it/core/failure/failure.dart';
import 'package:flutter_guess_it/core/model/either.dart';

abstract class GameRepository {
  Future<Either<Failure, String>> getRandomWord(int length);
  Future<Either<Failure, void>> checkWord(String word);
}
