
import 'package:breakingbad_api/data/model/character.dart';
import 'package:breakingbad_api/data/remote/characters_api.dart';
import 'package:breakingbad_api/data/repository/characters_repository.dart';
import 'package:breakingbad_api/domain/characters_cubit.dart';
import 'package:breakingbad_api/presentation/screens/characters_details_screen.dart';
import 'package:breakingbad_api/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter{
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter(){
  charactersRepository = CharactersRepository(CharactersApi());
  charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (BuildContext context) =>
        CharactersCubit(charactersRepository),
        child: CharactersScreen()
        )
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}