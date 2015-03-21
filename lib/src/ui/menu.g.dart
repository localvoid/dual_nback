// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-21T13:21:16.308Z

part of dual_nback.src.ui.menu;

// **************************************************************************
// Generator: UixGenerator
// Target: class MenuButton
// **************************************************************************

MenuButton createMenuButton([String data]) {
  final r = new MenuButton()..data = data;
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

Menu createMenu([dynamic data]) {
  final r = new Menu()..data = data;
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
