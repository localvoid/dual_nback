library dual_nback.src.speech;

import 'dart:html' as html;

class Speech {
  final Map<String, html.SpeechSynthesisUtterance> _letters = {};

  void say(String letter) {
    if (!_letters.containsKey(letter)) {
      final u = new html.SpeechSynthesisUtterance();
      u.text = letter;
      u.lang = 'en-US';
      _letters[letter] = u;
    }
    html.window.speechSynthesis.speak(_letters[letter]);
  }
}
