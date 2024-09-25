import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:digitalk_flutter_test_task/features/characters/ui/characters_screen/bloc/characters_bloc.dart';
import 'package:digitalk_flutter_test_task/features/characters/ui/characters_screen/widgets/character_item.dart';
import 'package:digitalk_flutter_test_task/features/characters/ui/characters_screen/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _setupScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CharactersBloc, CharactersState>(
          listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Repeat',
                    onPressed: () {
                      context.read<CharactersBloc>().add(GetCharactersEvent());
                    },
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            // Обработка состояний
            if (state.isFirstLoad && state.isLoading) {
              return const LoadingIndicator();
            }

            if (state.characters.isEmpty && state.errorMessage != null) {
              // Нет данных и есть ошибка
              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(child: Text(state.errorMessage!)),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.separated(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.characters.length + (state.isLoading ? 1 : 0),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(height: 1),
                ),
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return CharacterItem(charactersModelResults: state.characters[index]);
                  } else {
                    return const LoadingIndicator();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          // Достигли конца списка, загружаем следующую страницу
          context.read<CharactersBloc>().add(GetCharactersEvent());
        }
      }
    });
  }

  Future<void> _onRefresh() async {
    context.read<CharactersBloc>().add(RefreshCharactersEvent());
  }
}
