import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';

abstract class DeckLocalStorageRepositoryInterface {
  DeckEntity getLocalDeck();

  void setLocalDeck(DeckEntity deck);
}
