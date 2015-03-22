library dual_nback.src.ui.app_view;

import 'package:uix/uix.dart';
import '../app.dart';
import 'menu.dart';
import 'game_view.dart';

part 'app_view.g.dart';

@ComponentMeta()
class AppView extends Component {
  init() {
    addSubscription(app.onChange.listen(invalidate));
  }

  updateView() {
    updateRoot(vRoot(type: 'Application')(
      app.state == State.init ? vMenu() : vGameView(data: app.game)
    ));
  }
}
