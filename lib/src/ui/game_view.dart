library dual_nback.src.ui.game_view;

import 'dart:async';
import 'dart:html' as html;
import 'package:uix/uix.dart';
import '../game.dart';

part 'game_view.g.dart';

class CheckButtonData {
  final bool checked;
  final bool error;
  final String hotKey;
  final String label;

  const CheckButtonData({this.hotKey, this.label, this.checked: false, this.error: false});

  bool operator==(CheckButtonData other) =>
      (checked == other.checked && error == other.error
      && hotKey == other.hotKey && label == other.label);
}

@ComponentMeta()
class CheckButton extends Component<CheckButtonData> {
  updateView() {
    updateRoot(vRoot(type: 'CheckButton', classes: _rootClasses())([
      vElement('span', type: 'CheckButton_hotKey')(data.hotKey),
      vElement('span', type: 'CheckButton_label')(data.label)
    ]));
  }

  List<String> _rootClasses() {
    if (data.checked) {
      if (data.error) {
        return const ['checked', 'error'];
      }
      return const ['checked'];
    } else if (data.error) {
      return const ['error'];
    }
    return null;
  }
}

@ComponentMeta()
class Grid extends Component<Game> {
  set data(Game newData) {
    data_ = newData;
    invalidate();
  }

  updateView() {
    final children = [];
    for (var i = 0; i < Game.visualCount; i++) {
      if (data.isVisualVisible && data.currentVisual == i) {
        children.add(vElement('div', type: 'Cell', classes: const ['checked']));
      } else {
        children.add(vElement('div', type: 'Cell'));
      }
    }

    updateRoot(vRoot(type: 'Grid', children: children));
  }
}

@ComponentMeta()
class GameStats extends Component<Game> {
  set data(Game newData) {
    data_ = newData;
    invalidate();
  }

  updateView() {
    updateRoot(vRoot(type: 'GameStats')('${data.visualFalsePositives}/${data.visualMisses} | ${data.audioFalsePositives}/${data.audioMisses}'));
  }
}

@ComponentMeta()
class GameView extends Component<Game> {
  set data(Game newData) {
    data_ = newData;
    invalidate();
  }

  StreamSubscription _keySub;

  init() {
    element.onClick
        ..matches('.Game_buttons_visual').listen(_visualClick)
        ..matches('.Game_buttons_audio').listen(_audioClick);
  }

  _visualClick(html.MouseEvent e) {
    e.preventDefault();
    data.checkVisual();
  }

  _audioClick(html.MouseEvent e) {
    e.preventDefault();
    data.checkAudio();
  }

  _handleKeyDown(html.KeyboardEvent e) {
    if (e.keyCode == html.KeyCode.A) {
      e.preventDefault();
      data.checkVisual();
    } else if (e.keyCode == html.KeyCode.L) {
      e.preventDefault();
      data.checkAudio();
    }
  }

  updateState() {
    addTransientSubscription(data.onChange.listen(invalidate));
    return true;
  }

  updateView() {
    updateRoot(vRoot(type: 'Game')([
      vGameStats(data: data),
      vGrid(data: data),
      vElement('div', type: 'Game_buttons')([
        vCheckButton(
            type: 'Game_buttons_visual',
            data: new CheckButtonData(hotKey: 'A', label: 'Visual', checked: data.visualChecked, error: data.visualError)),
        vCheckButton(
            type: 'Game_buttons_audio',
            data: new CheckButtonData(hotKey: 'L', label: 'Audio', checked: data.audioChecked, error: data.audioError)),
      ])
    ]));
  }

  attached() {
    _keySub = html.document.onKeyDown.listen(_handleKeyDown);
  }

  detached() {
    _keySub.cancel();
  }
}
