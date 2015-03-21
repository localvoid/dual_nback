library dual_nback.src.app;

import 'dart:math' as math;
import 'observable.dart';
import 'speech.dart';
import 'game.dart';

enum State {
  init,
  running
}

class Application extends ObservableNode {
  final math.Random _rnd = new math.Random();

  State _state = State.init;
  Speech _speech = new Speech();
  Game _game;

  State get state => _state;
  Game get game => _game;

  Application() {
  }

  void start() {
    _game = new Game(_rnd, _speech)..start();
    _state = State.running;
    notify();
  }

  void stop() {
    _game.dispose();
    _game = null;
    _state = State.init;
    notify();
  }
}

Application app;

initApp() {
  app = new Application();
}