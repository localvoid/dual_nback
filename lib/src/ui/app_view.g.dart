// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T11:22:56.324Z

part of dual_nback.src.ui.app_view;

// **************************************************************************
// Generator: UixGenerator
// Target: class AppView
// **************************************************************************

AppView createAppView([dynamic data, Component parent]) {
  final r = new AppView()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vAppView({dynamic data, Object key, String type,
    Map<String, String> attrs, Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createAppView,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
