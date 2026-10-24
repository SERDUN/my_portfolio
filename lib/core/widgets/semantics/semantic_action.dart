import 'package:flutter/widgets.dart';

/// Attaches an accessibility [label] and a stable [identifier] to the single
/// interactive control in [child]. The subtree is merged into one node, so
/// label, identifier and action cannot drift apart.
///
/// [child] must contain exactly ONE interactive control: merging a subtree
/// with several tappable descendants collapses them and the others become
/// unreachable. Use the default constructor for controls that announce their
/// own role (buttons, IconButton, ListTile); [SemanticAction.button] or
/// [SemanticAction.link] for bare tap targets (InkWell) so the role is added.
///
/// When [label] replaces what the child shows, wrap the visible text in
/// [ExcludeSemantics]: merged text is appended to the label and would be
/// read twice.
class SemanticAction extends StatelessWidget {
  const SemanticAction({super.key, this.label, this.identifier, this.selected, required this.child}) : _role = null;

  const SemanticAction.button({super.key, this.label, this.identifier, this.selected, required this.child})
    : _role = _Role.button;

  const SemanticAction.link({super.key, this.label, this.identifier, this.selected, required this.child})
    : _role = _Role.link;

  final String? label;
  final String? identifier;

  /// For toggles and filters: whether this option is the active one.
  final bool? selected;
  final _Role? _role;
  final Widget child;

  @override
  Widget build(BuildContext context) => MergeSemantics(
    child: Semantics(
      label: label,
      identifier: identifier,
      selected: selected,
      button: _role == _Role.button ? true : null,
      link: _role == _Role.link ? true : null,
      child: child,
    ),
  );
}

enum _Role { button, link }

/// Attaches a stable [identifier] and changes nothing about how the subtree is
/// announced. For a screen anchor, where merging would collapse the whole
/// screen into one node.
class SemanticId extends StatelessWidget {
  const SemanticId({super.key, required this.identifier, required this.child});

  final String identifier;
  final Widget child;

  @override
  Widget build(BuildContext context) => Semantics(identifier: identifier, container: true, child: child);
}
