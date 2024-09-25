import 'package:digitalk_flutter_test_task/core/error/failure.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:dartz/dartz.dart';

abstract class CharactersRepo {
  Future<Either<Failure, List<CharactersModelResults>>> getCharacters(int pages);
}
