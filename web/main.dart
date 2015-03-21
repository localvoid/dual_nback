import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'package:dual_nback/src/app.dart';
import 'package:dual_nback/src/ui/app_view.dart';

void main() {
  initUix();
  initApp();

  scheduler.nextFrame.write().then((_) {
    injectComponent(createAppView(), html.document.body);
  });
}
