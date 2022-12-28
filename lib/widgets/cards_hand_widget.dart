import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class CardsHandWidget extends StatefulWidget {
  const CardsHandWidget({Key? key, required this.cards}) : super(key: key);

  final List<String> cards;
  final int _degreesBetweenCards = 12;

  @override
  State<CardsHandWidget> createState() => _CardsHandWidgetState();
}

class _CardsHandWidgetState extends State<CardsHandWidget> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.4, initialPage: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.cards.asMap().entries.map((entry){
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.rotate(
            angle: (-25 + (entry.key * widget._degreesBetweenCards)) * math.pi/180,
            child: Transform.translate(
              offset: const Offset(0,-220),
              child: Image.network(widget.cards[1], height: 200),
            ),
          ),
        );
      }).toList(),
    );

    //   PageView(
    //   controller: _pageController,
    //   children: widget.cards.map((card) {
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Image.network(card),
    //     );
    //   }).toList(),
    // );
  }
}

//Image.network("https://deckofcardsapi.com/static/img/5D.png")
