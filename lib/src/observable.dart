library dual_nback.src.observable;

import 'dart:async';

abstract class ObservableNode {
  bool _notifying = false;
  StreamController _onChangeController;
  Stream get onChange {
    if (_onChangeController == null) {
      _onChangeController = new StreamController.broadcast();
    }
    return _onChangeController.stream;
  }

  void notify() {
    if (_onChangeController != null && _onChangeController.hasListener) {
      if (!_notifying) {
        _notifying = true;
        scheduleMicrotask(_notifyFinish);
      }
    }
  }

  void _notifyFinish() {
    _notifying = false;
    _onChangeController.add(null);
  }
}
