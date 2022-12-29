import 'package:flutter_bloc_plus_freezed/domain/entities/card_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';

abstract class CardsRepositoryInterface {
  Future<List<CardEntity>> getCards(DeckEntity deck);
  Future<DeckEntity> generateDeck();
}
