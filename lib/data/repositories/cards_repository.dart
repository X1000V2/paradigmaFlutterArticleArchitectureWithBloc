import 'package:flutter_bloc_plus_freezed/data/services/cards/cards_service.dart';
import 'package:flutter_bloc_plus_freezed/data/services/model/get_cards_response.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/card_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/repositories/cards_repository_interface.dart';

class CardsRepository implements CardsRepositoryInterface {
  CardsService cardsService;

  CardsRepository({required this.cardsService});

  @override
  Future<List<CardEntity>> getCards(DeckEntity deck) async {
    // pedimos las cartas
    GetCardsResponse? cardsResponse = await cardsService.getCardsFromService(deck);
    if (cardsResponse != null) {
      List<CardEntity> cardList = cardsResponse.cards.map((cardToMap) {
        return CardEntity(name: cardToMap.name, urlImage: cardToMap.urlImage);
      }).toList();
      return cardList;
    } else {
      return List<CardEntity>.empty();
    }
  }

  @override
  Future<DeckEntity> generateDeck() async {
    String deckId = await cardsService.generateDeck();
    return DeckEntity(deckId: deckId);
  }
}
