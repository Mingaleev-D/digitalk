import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digitalk_flutter_test_task/core/error/failure.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:digitalk_flutter_test_task/features/characters/domain/usecase/get_characters_usecase.dart';
import 'package:equatable/equatable.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUsecase getCharactersUsecase;

  CharactersBloc(this.getCharactersUsecase) : super(CharactersInitial()) {
    on<GetCharactersEvent>(_onGetCharacters);
    on<RefreshCharactersEvent>(_onRefreshCharacters);
    // Инициируем начальную загрузку
    add(GetCharactersEvent());
  }

  Future<void> _onGetCharacters(GetCharactersEvent event, Emitter<CharactersState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(
      isLoading: true,
      isFirstLoad: state.page == 1,
      errorMessage: null,
    ));

    final failureOrCharacters = await getCharactersUsecase.call(state.page);

    failureOrCharacters.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        ));
      },
      (characters) {
        final nextPage = state.page + 1;
        final updatedCharacters = List<CharactersModelResults>.from(state.characters)
          ..addAll(characters);
        emit(state.copyWith(
          characters: updatedCharacters,
          isLoading: false,
          errorMessage: null,
          page: nextPage, // Обновление номера страницы
        ));
      },
    );
  }

  Future<void> _onRefreshCharacters(
      RefreshCharactersEvent event, Emitter<CharactersState> emit) async {
    // Сохраняем текущие данные и страницу
    final currentPage = state.page;
    final currentCharacters = state.characters;

    emit(state.copyWith(
      isLoading: true,
      isFirstLoad: true,
      errorMessage: null,
      // Не очищаем characters, чтобы сохранить текущие данные при ошибке
    ));

    final failureOrCharacters = await getCharactersUsecase.call(1); // Обновляем первую страницу

    failureOrCharacters.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isFirstLoad: false,
          errorMessage: _mapFailureToMessage(failure),
          // Сохраняем текущие characters и page, ничего не меняя
        ));
      },
      (characters) {
        emit(state.copyWith(
          characters: characters,
          isLoading: false,
          isFirstLoad: false,
          errorMessage: null,
          page: 2, // Устанавливаем следующую страницу после успешного обновления
        ));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case OfflineFailure:
        return 'Offline Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
