// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T11:22:56.372Z

part of dual_nback.src.ui.menu;

// **************************************************************************
// Generator: UixGenerator
// Target: class MenuButton
// **************************************************************************

MenuButton createMenuButton([String data, Component parent]) {
  final r = new MenuButton()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vMenuButton({String data, Object key, String type,
    Map<String, String> attrs, Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createMenuButton,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);

// **************************************************************************
// Generator: UixGenerator
// Target: class Menu
// **************************************************************************

Menu createMenu([dynamic data, Component parent]) {
  final r = new Menu()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vMenu({dynamic data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createMenu,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
