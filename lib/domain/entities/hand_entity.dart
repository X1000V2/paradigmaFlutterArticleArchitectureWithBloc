import 'package:flutter_bloc_plus_freezed/domain/entities/card_entity.dart';

class HandEntity {
  List<CardEntity> cardList;
  int remainingCardsInDeck;

  HandEntity({required this.cardList, required this.remainingCardsInDeck});
}
