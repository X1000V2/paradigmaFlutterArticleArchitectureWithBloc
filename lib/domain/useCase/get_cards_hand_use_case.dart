import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_plus_freezed/data/repositories/deck_local_storage_repository.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/card_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';

class GetCardsHandUseCase {
  CardsRepository cardsRepository;
  DeckLocalStorageRepository deckLocalStorageRepository;

  GetCardsHandUseCase({required this.cardsRepository, required this.deckLocalStorageRepository});

  Future<List<CardEntity>> getCards() async{
    DeckEntity localDeck = deckLocalStorageRepository.getLocalDeck();
    if (localDeck.deckId.isEmpty) {
      // si no tenemos un deck local, generamos uno nuevo
      DeckEntity generatedDeck = await cardsRepository.generateDeck();
      localDeck = generatedDeck;
      deckLocalStorageRepository.setLocalDeck(generatedDeck);
    }

    // get hand cards
    List<CardEntity> cardList = await cardsRepository.getCards(localDeck);
    return cardList;
  }
}
