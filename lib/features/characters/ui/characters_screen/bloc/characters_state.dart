part of 'characters_bloc.dart';

class CharactersState extends Equatable {
  final List<CharactersModelResults> characters;
  final bool isLoading;
  final bool isFirstLoad;
  final String? errorMessage;
  final int page; // Добавлено поле page

  const CharactersState({
    this.characters = const [],
    this.isLoading = false,
    this.isFirstLoad = false,
    this.errorMessage,
    this.page = 1, // Инициализация page значением по умолчанию
  });

  CharactersState copyWith({
    List<CharactersModelResults>? characters,
    bool? isLoading,
    bool? isFirstLoad,
    String? errorMessage,
    int? page, // Добавлен параметр page
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      errorMessage: errorMessage,
      page: page ?? this.page, // Обновление page
    );
  }

  @override
  List<Object?> get props => [characters, isLoading, isFirstLoad, errorMessage, page];
}

class CharactersInitial extends CharactersState {
  @override
  List<Object> get props => [];
}
