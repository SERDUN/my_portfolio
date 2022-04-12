import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TreeRoot extends StatefulWidget {
  final int level;
  final bool expanded;
  final double offsetLeft;
  final List<Widget> children;

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;

  final Function? titleOnTap;
  final Function? leadingOnTap;
  final Function? trailingOnTap;

  const TreeRoot({
    Key? key,
    this.level = 0,
    this.expanded = false,
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

class _TreeNodeState extends State<TreeRoot>
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

    return GestureDetector(
      child: Card(
        color: Theme.of(context).cardTheme.color,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              //A RenderFlex overflowed by 58 pixels on the right.
              //
              // The relevant error-causing widget was:
              //   Row Row:file:///C:/Users/Dmitro/StudioProjects/my_portfolio/lib/presenter/ui/widgets/tree/tree_root.dart:78:24
              // The overflowing RenderFlex has an orientation of Axis.horizontal.
              // The edge of the RenderFlex that is overflowing has been marked in the rendering with a yellow and black striped pattern. This is usually caused by the contents being too big for the RenderFlex.
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    widget.title ?? Container(),
                    const SizedBox(width: 8,),
                    Text(
                      "(Основний напрям)",
                      // style: GoogleFonts.montserrat(
                      //     textStyle: const TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black26,
                      //         letterSpacing: 1)),
                    ),
                    const Spacer(),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _handleTap();
                        },
                        child: RotationTransition(
                          child:  Lottie.asset('assets/animation/arrow_vertical.json',width: 32,height: 32,),
                          turns: _turnsTween.animate(_rotationController),
                        ),
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
                      right: level + 1 * offsetLeft),
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
      if (_isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
      if (widget.trailingOnTap != null && widget.trailingOnTap is Function) {
        widget.trailingOnTap!();
      }
    });
  }
}
