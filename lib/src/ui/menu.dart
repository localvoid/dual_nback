library dual_nback.src.ui.menu;

import 'dart:html' as html;
import 'package:uix/uix.dart';
import '../app.dart';

part 'menu.g.dart';

@ComponentMeta()
class MenuButton extends Component<String> {
  updateView() { updateRoot(vRoot(type: 'MenuButton')(data)); }
}

@ComponentMeta()
class Menu extends Component {
  init() {
    element.onClick
      ..matches('.StartButton').listen(_start);
  }

  void _start(html.MouseEvent e) {
    e.preventDefault();
    app.start();
  }

  updateView() {
    updateRoot(vRoot(type: 'Menu')([
      vElement('div', type: 'MenuTitle')('Dual N-Back'),
      vComponent($MenuButton, type: 'StartButton', data: 'Start')
    ]));
  }
}
