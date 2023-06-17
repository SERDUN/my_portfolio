import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extension/style/own_theme_fields.dart';

class TreeNode extends StatefulWidget {
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

  @override
  _TreeNodeState createState() => _TreeNodeState();
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
            padding: const EdgeInsets.only(left: 0.0, right: 12.0, top: 8),
            child: InkWell(
                onTap: children.isNotEmpty
                    ? () {
                  if (widget.leadingOnTap != null &&
                      widget.leadingOnTap is Function) {
                    widget.leadingOnTap!();
                  }
                  setState(() {
                    _isExpanded = !_isExpanded;
                    if (widget.trailingOnTap != null &&
                        widget.trailingOnTap is Function) {
                      widget.trailingOnTap!();
                    }
                  });
                }
                    : null,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: children.length > 1
                          ? Image.asset("assets/image/icons/category.webp",
                          width: 24, height: 24)
                          : Image.asset("assets/image/icons/sub_category.webp",
                          width: 24, height: 24),
                      padding: const EdgeInsets.all(8),
                    ),
                    Expanded(child: widget.title ?? Container()),
                    const SizedBox(width: 6.0),
                    Visibility(
                      visible: children.isNotEmpty,
                      child: Center(
                          child: Transform.rotate(
                              angle: -pi / (_isExpanded ? 1 : 360),
                              child: Image.asset(
                                "assets/image/icons/up_arrow.webp",
                                width: 16,
                                height: 16,
                                color: Theme
                                    .of(context)
                                    .colorPlate
                                    .call()
                                    .orange,
                              )),
                      ),
                    ),
                  ],
                ))),
        Visibility(
          visible: children.isNotEmpty && _isExpanded,
          child: Padding(
            padding: EdgeInsets.only(left: level + 1 * offsetLeft),
            child: Column(
              children: widget.children,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
      ],
    );
  }
}
