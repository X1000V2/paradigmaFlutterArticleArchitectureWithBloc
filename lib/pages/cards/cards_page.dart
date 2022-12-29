import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/pages/cards/cards_hand_widget.dart';
import 'package:flutter_bloc_plus_freezed/utils/resources.dart';

class CardsPage extends StatefulWidget {
  static const route = "cards";

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Resources.textToolbarTitle),
      ),
      body: CardsHandWidget(
        cards: List.of(
          [
            "https://deckofcardsapi.com/static/img/5D.png",
            "https://deckofcardsapi.com/static/img/5D.png",
            "https://deckofcardsapi.com/static/img/5D.png",
            "https://deckofcardsapi.com/static/img/5D.png",
            "https://deckofcardsapi.com/static/img/5D.png",
          ],
        ),
      ),
    );
  }
}
