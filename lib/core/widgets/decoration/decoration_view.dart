import 'package:material_ui/material_ui.dart';

class DecorationViewLines extends StatelessWidget {
  const DecorationViewLines({
    super.key,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
  });
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 75, height: 2, color: Theme.of(context).primaryColor),
          const SizedBox(height: 3),
          Container(width: 50, height: 2, color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
