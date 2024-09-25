import 'package:dartz/dartz.dart';
import 'package:digitalk_flutter_test_task/core/error/failure.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:digitalk_flutter_test_task/features/characters/domain/repository/characters_repo.dart';

class GetCharactersUsecase {
  final CharactersRepo charactersRepo;

  GetCharactersUsecase(this.charactersRepo);

  Future<Either<Failure, List<CharactersModelResults>>> call(int pages) async {
    return await charactersRepo.getCharacters(pages);
  }
}
