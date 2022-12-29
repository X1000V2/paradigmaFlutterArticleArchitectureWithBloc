import 'package:flutter_bloc_plus_freezed/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_plus_freezed/data/repositories/deck_local_storage_repository.dart';
import 'package:flutter_bloc_plus_freezed/data/services/cards/cards_service.dart';
import 'package:flutter_bloc_plus_freezed/domain/useCase/get_cards_hand_use_case.dart';
import 'package:injector/injector.dart';
final appInjector = Injector.appInstance;
void initInjection() {

  // Data sources injection
  appInjector.registerSingleton<CardsService>(() => CardsService());
  appInjector.registerSingleton<DeckLocalStorageRepository>(() => DeckLocalStorageRepository());

  // Repository injection
  appInjector.registerSingleton<CardsRepository>(() => CardsRepository(
        cardsService: appInjector.get<CardsService>(),
      ));

  // Use case injection
  appInjector.registerSingleton<GetCardsHandUseCase>(() => GetCardsHandUseCase(
        cardsRepository: appInjector.get<CardsRepository>(),
        deckLocalStorageRepository: appInjector.get<DeckLocalStorageRepository>(),
      ));
}
