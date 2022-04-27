import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';

class TreeRoot extends StatefulWidget {
  final int level;
  final bool expanded;
  final double offsetLeft;
  final List<Widget> children;

  final Widget? title;

  const TreeRoot({
    Key? key,
    this.level = 0,
    this.expanded = false,
    this.offsetLeft = 24.0,
    this.children = const [],
    this.title = const Text('Title'),
  }) : super(key: key);

  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeRoot> {
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
    return GestureDetector(
      child: Card(
        color: Theme.of(context).cardTheme.color,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    widget.title ?? Container(),
                    const SizedBox(
                      width: 8,
                    ),
                    const Spacer(),
                    Center(
                      child: InkWell(
                        onTap: () {
                          _handleTap();
                        },
                        child: Transform.rotate(
                            angle: -pi / (_isExpanded ? 1 : 360),
                            child: Image.asset(
                              "assets/image/icons/up_arrow.webp",
                              width: 16,
                              height: 16,
                              color: Theme.of(context).colorPlate.call().orange,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: children.isNotEmpty && _isExpanded,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: level + 1 * offsetLeft,
                  ),
                  child: Column(
                    children: widget.children,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => _handleTap(),
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
