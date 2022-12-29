import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:localstorage/localstorage.dart';

class DeckLocalStorageRepository{
  static final LocalStorage storage = LocalStorage('deck_local_storage');

  DeckEntity getLocalDeck(){
    String localDeckId = storage.getItem("local_deck_id")??"";
    return DeckEntity(deckId: localDeckId);
  }

  void setLocalDeck(DeckEntity deck){
    storage.setItem("local_deck_id", deck.deckId);
  }
}