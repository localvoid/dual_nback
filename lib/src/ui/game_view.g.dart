// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-21T17:31:35.935Z

part of dual_nback.src.ui.game_view;

// **************************************************************************
// Generator: UixGenerator
// Target: class CheckButtonData
// **************************************************************************

abstract class _CheckButtonDataShallowEqOperator {
  bool get checked;
  bool get error;
  String get hotKey;
  String get label;
  const _CheckButtonDataShallowEqOperator();
  bool operator ==(CheckButtonData other) => (identical(this, other) ||
      ((checked == other.checked) &&
          (error == other.error) &&
          (hotKey == other.hotKey) &&
          (label == other.label)));
}

// **************************************************************************
// Generator: UixGenerator
// Target: class CheckButton
// **************************************************************************

CheckButton createCheckButton([CheckButtonData data]) {
  final r = new CheckButton()..data = data;
  r.init();
  return r;
}
VNode vCheckButton({CheckButtonData data, Object key, String type,
    Map<String, String> attrs, Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createCheckButton,
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
// Target: class Grid
// **************************************************************************

Grid createGrid([Game data]) {
  final r = new Grid()..data = data;
  r.init();
  return r;
}
VNode vGrid({Game data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createGrid,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);

// **************************************************************************
// Generator: UixGenerator
// Target: class GameStats
// **************************************************************************

GameStats createGameStats([Game data]) {
  final r = new GameStats()..data = data;
  r.init();
  return r;
}
VNode vGameStats({Game data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createGameStats,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);

// **************************************************************************
// Generator: UixGenerator
// Target: class GameView
// **************************************************************************

GameView createGameView([Game data]) {
  final r = new GameView()..data = data;
  r.init();
  return r;
}
VNode vGameView({Game data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createGameView,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
