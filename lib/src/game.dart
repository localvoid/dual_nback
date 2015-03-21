library dual_nback.src.game;

import 'dart:async';
import 'dart:math' as math;
import 'observable.dart';
import 'speech.dart';

class Game extends ObservableNode {
  static const double defaultAudioMatchProbability = 0.1;
  static const double defaultVisualMatchProbability = 0.1;

  static const Duration startDelayDuration = const Duration(milliseconds: 500);
  static const Duration visualDuration = const Duration(milliseconds: 1000);
  static const Duration trialDuration = const Duration(milliseconds: 2000);
  static const Duration feedbackDuration = const Duration(milliseconds: 500);

  static const String audioLetters = 'CRTSHJMQL';

  static const int visualCount = 9;

  final math.Random _rnd;
  final Speech _speech;

  Timer _timer;

  final int _n;

  double _audioMatchProbability = defaultAudioMatchProbability;
  double _visualMatchProbability = defaultVisualMatchProbability;

  List<String> _audioHistory = [];
  List<int> _visualHistory = [];

  bool _visualVisible = false;

  bool _audioChecked = false;
  bool _visualChecked = false;
  bool _audioError = false;
  bool _visualError = false;

  int _audioFalsePositives = 0;
  int _visualFalsePositives = 0;
  int _audioMisses = 0;
  int _visualMisses = 0;

  int get n => _n;

  String get currentAudio => _audioHistory.last;
  int get currentVisual => _visualHistory.last;

  bool get isVisualVisible => _visualVisible;

  bool get audioChecked => _audioChecked;
  bool get visualChecked => _visualChecked;
  bool get audioError => _audioError;
  bool get visualError => _visualError;

  int get audioFalsePositives => _audioFalsePositives;
  int get visualFalsePositives => _visualFalsePositives;
  int get audioMisses => _audioMisses;
  int get visualMisses => _visualMisses;

  Game(this._rnd, this._speech, {int n: 2}) : _n = n {
    assert(trialDuration >= visualDuration);
  }

  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  void start() {
    _timer = new Timer(startDelayDuration, _trialStart);
    notify();
  }

  void checkAudio() {
    if (_audioHistory.length > _n) {
      _audioChecked = true;
      notify();
    }
  }

  void checkVisual() {
    if (_visualHistory.length > _n) {
      _visualChecked = true;
      notify();
    }
  }

  void _trialStart() {
    _visualChecked = false;
    _audioChecked = false;
    _visualError = false;
    _audioError = false;
    _next();

    _speech.say(currentAudio);
    _visualVisible = true;

    _timer = new Timer(visualDuration, _hideVisual);
    notify();
  }

  void _hideVisual() {
    _visualVisible = false;
    _timer = new Timer(trialDuration - visualDuration, _trialEnd);
    notify();
  }

  void _trialEnd() {
    if (_audioHistory.length > _n) {
      final nBack = _audioHistory[_audioHistory.length - _n - 1];
      if (audioChecked && nBack != currentAudio) {
        _audioError = true;
        _audioFalsePositives += 1;
      } else if (!audioChecked && nBack == currentAudio) {
        _audioError = true;
        _audioMisses += 1;
      }
    }
    if (_visualHistory.length > _n) {
      final nBack = _visualHistory[_visualHistory.length - _n - 1];
      if (visualChecked && nBack != currentVisual) {
        _visualError = true;
        _visualFalsePositives += 1;
      } else if (!visualChecked && nBack == currentVisual) {
        _visualError = true;
        _visualMisses += 1;
      }
    }

    _timer = new Timer(feedbackDuration, _trialStart);
    notify();
  }

  void _next() {
    final String a = _rndAudio();
    final int v = _rndVisual();

    _audioHistory.add(a);
    _visualHistory.add(v);
  }

  String _rndAudio() {
    if (_audioHistory.length > _n && _rnd.nextDouble() < _audioMatchProbability) {
      return _audioHistory[_audioHistory.length - _n];
    }
    return audioLetters[_rnd.nextInt(audioLetters.length)];
  }

  int _rndVisual() {
    if (_visualHistory.length > _n && _rnd.nextDouble() < _visualMatchProbability) {
      return _visualHistory[_visualHistory.length - _n];
    }
    return _rnd.nextInt(visualCount);
  }
}
