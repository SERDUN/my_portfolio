import 'package:flutter/material.dart';

class TreeNode extends StatefulWidget {
  final int level;
  final bool expanded;
  final bool isRoot;
  final double offsetLeft;
  final List<Widget> children;

  final Widget? title;
  final Widget? leading;
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
    this.leading = const IconButton(
      icon: Icon(Icons.star_border),
      iconSize: 16,
      onPressed: null,
    ),
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

class _TreeNodeState extends State<TreeNode>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: 0.0, end: -0.5);

  @override
  initState() {
    _isExpanded = widget.expanded;
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 999),
      vsync: this,
    );
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
          padding: const EdgeInsets.only(left: 0.0, right: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (widget.leadingOnTap != null &&
                      widget.leadingOnTap is Function) {
                    widget.leadingOnTap!();
                  }
                },
                child: widget.leading ??
                    IconButton(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 0),
                      icon: children.length > 1
                          ? Image.asset("assets/image/icons/category.png",width: 24,height: 24)
                          : Image.asset("assets/image/icons/sub_category.png",width: 24,height: 24),
                      iconSize: 16,
                      onPressed: null,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.titleOnTap != null &&
                      widget.titleOnTap is Function) {
                    widget.titleOnTap!();
                  }
                },
                child: widget.title ?? Container(),
              ),
              const SizedBox(width: 6.0),
              Visibility(
                visible: children.isNotEmpty,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                        if (_isExpanded) {
                          _rotationController.forward();
                        } else {
                          _rotationController.reverse();
                        }
                        if (widget.trailingOnTap != null &&
                            widget.trailingOnTap is Function) {
                          widget.trailingOnTap!();
                        }
                      });
                    },
                    child: RotationTransition(
                      child: widget.trailing ??
                          const IconButton(
                            icon: Icon(Icons.expand_more),
                            iconSize: 16,
                            onPressed: null,
                          ),
                      turns: _turnsTween.animate(_rotationController),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: children.length > 0 && _isExpanded,
          child: Padding(
            padding: EdgeInsets.only(
                left: level + 1 * offsetLeft, right: level + 1 * offsetLeft),
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
