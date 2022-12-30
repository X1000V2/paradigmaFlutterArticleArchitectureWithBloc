import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/hand_entity.dart';

abstract class CardsRepositoryInterface {
  Future<HandEntity> getCards(DeckEntity deck);

  Future<DeckEntity> generateDeck();
}
