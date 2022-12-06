
import 'package:bloc/bloc.dart';
import 'package:breakingbad_api/data/model/quote.dart';
import 'package:meta/meta.dart';

import '../data/model/character.dart';
import '../data/repository/characters_repository.dart';


part 'characters_state.dart';


class CharactersCubit extends Cubit<CharactersState> {

  final CharactersRepository charactersRepository;
   List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  
  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }

}
