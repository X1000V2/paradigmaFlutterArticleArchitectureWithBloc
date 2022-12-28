import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/pages/widgets/cards_hand_widget.dart';
import 'package:flutter_bloc_plus_freezed/utils/resources.dart';

class CardsPage extends StatefulWidget {
  static const route = "cards";

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          Duration animationDuration = _controller.duration!;
          _controller.duration = const Duration(seconds: 0);
          _controller.reverse();
          _controller.duration = animationDuration;
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(Resources.textToolbarTitle)),
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
