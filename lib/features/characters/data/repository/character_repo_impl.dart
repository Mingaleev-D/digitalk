import 'package:dartz/dartz.dart';
import 'package:digitalk_flutter_test_task/core/error/exception.dart';
import 'package:digitalk_flutter_test_task/core/error/failure.dart';
import 'package:digitalk_flutter_test_task/core/network/network_info.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/datasource/characters_datasource.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:digitalk_flutter_test_task/features/characters/domain/repository/characters_repo.dart';

class CharactersRepoImpl implements CharactersRepo {
  final CharactersDatasource charactersDatasource;
  final NetworkInfo networkInfo;

  CharactersRepoImpl(
    this.charactersDatasource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, List<CharactersModelResults>>> getCharacters(int pages) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacters = await charactersDatasource.getCharacters(pages);
        return Right(remoteCharacters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
