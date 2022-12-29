import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_plus_freezed/data/repositories/deck_local_storage_repository.dart';
import 'package:flutter_bloc_plus_freezed/di/dependency_injection.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/card_entity.dart';
import 'package:flutter_bloc_plus_freezed/domain/useCase/get_cards_hand_use_case.dart';
import 'package:flutter_bloc_plus_freezed/pages/cards/cards_hand_widget.dart';
import 'package:flutter_bloc_plus_freezed/utils/resources.dart';

class CardsPage extends StatefulWidget {
  static const route = "cards";

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> with TickerProviderStateMixin {
  List<CardEntity> cards = [];

  @override
  void initState() {
    callServiceCards();
    super.initState();
  }

  void callServiceCards() async {
    GetCardsHandUseCase getCardsHandUseCase = GetCardsHandUseCase(
      cardsRepository: appInjector.get<CardsRepository>(),
      deckLocalStorageRepository: appInjector.get<DeckLocalStorageRepository>(),
    );
    var newCards = await getCardsHandUseCase.getCards();
    setState(() {
      cards = newCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Resources.textToolbarTitle),
      ),
      body: CardsHandWidget(
        cards: cards,
      ),
    );
  }
}
