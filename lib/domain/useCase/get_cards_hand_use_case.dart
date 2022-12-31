import 'package:flutter_bloc_plus_freezed/data/repositories/deck_local_storage_repository.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/hand_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/repositoryInterfaces/cards_repository_interface.dart';

class GetCardsHandUseCase {
  CardsRepositoryInterface cardsRepository;
  DeckLocalStorageRepository deckLocalStorageRepository;

  GetCardsHandUseCase({required this.cardsRepository, required this.deckLocalStorageRepository});

  Future<HandEntity> getCards() async {
    DeckEntity localDeck = deckLocalStorageRepository.getLocalDeck();
    if (localDeck.deckId.isEmpty || localDeck.remainingCards <= 0) {
      // si no tenemos un deck local, generamos uno nuevo
      DeckEntity generatedDeck = await cardsRepository.generateDeck();
      localDeck = generatedDeck;
      deckLocalStorageRepository.setLocalDeck(generatedDeck);
    }

    // get hand cards
    HandEntity hand = await cardsRepository.getCards(localDeck);
    // update deck with remaining cards available
    deckLocalStorageRepository.setLocalDeck(DeckEntity(
      deckId: localDeck.deckId,
      remainingCards: hand.remainingCardsInDeck,
    ));
    return hand;
  }
}
