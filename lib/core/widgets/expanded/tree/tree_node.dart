import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

import 'package:my_portfolio/app/app.dart';

class TreeNode extends StatefulWidget {
  const TreeNode({
    Key? key,
    this.level = 0,
    this.expanded = false,
    this.isRoot = false,
    this.offsetLeft = 24.0,
    this.children = const [],
    this.title = const Text('Title'),
    this.trailing = const IconButton(
      icon: Icon(Icons.expand_more),
      iconSize: 16,
      onPressed: null,
    ),
    this.titleOnTap,
    this.leadingOnTap,
    this.trailingOnTap,
  }) : super(key: key);

  final int level;
  final bool expanded;
  final bool isRoot;
  final double offsetLeft;
  final List<Widget> children;

  final Widget? title;
  final Widget? trailing;

  final Function? titleOnTap;
  final Function? leadingOnTap;
  final Function? trailingOnTap;

  @override
  State<TreeNode> createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> {
  bool _isExpanded = false;

  @override
  initState() {
    _isExpanded = widget.expanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final level = widget.level;
    final children = widget.children;
    final offsetLeft = widget.offsetLeft;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 12.0, top: 16),
          child: InkWell(
            onTap: children.isNotEmpty
                ? () {
                    if (widget.leadingOnTap != null && widget.leadingOnTap is Function) {
                      widget.leadingOnTap!();
                    }
                    setState(() {
                      _isExpanded = !_isExpanded;
                      if (widget.trailingOnTap != null && widget.trailingOnTap is Function) {
                        widget.trailingOnTap!();
                      }
                    });
                  }
                : null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: children.length > 1
                      ? Assets.image.icons.category.image(
                          width: 24,
                          height: 24,
                          color: Theme.of(context).colorScheme.onBackground,
                        )
                      : Assets.image.icons.subCategory.image(width: 24, height: 24),
                ),
                Expanded(child: widget.title ?? Container()),
                const SizedBox(width: 6.0),
                Visibility(
                  visible: children.isNotEmpty,
                  child: Center(
                    child: Icon(
                      _isExpanded ? Ionicons.pizza : Ionicons.pizza_outline,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: children.isNotEmpty && _isExpanded,
          child: Padding(
            padding: EdgeInsets.only(left: level + 1 * offsetLeft),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
