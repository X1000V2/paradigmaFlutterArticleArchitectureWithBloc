import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:localstorage/localstorage.dart';

class DeckLocalStorageRepository{
  static final LocalStorage storage = LocalStorage('deck_local_storage');

  DeckEntity getLocalDeck(){
    String localDeckId = storage.getItem("local_deck_id")??"";
    int localDeckRemainingCards = storage.getItem("local_deck_remaining")??0;
    return DeckEntity(deckId: localDeckId, remainingCards: localDeckRemainingCards);
  }

  void setLocalDeck(DeckEntity deck){
    storage.setItem("local_deck_id", deck.deckId);
    storage.setItem("local_deck_remaining", deck.remainingCards);
  }
}