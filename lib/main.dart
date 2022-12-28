import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/widgets/cards_hand_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bloc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
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
