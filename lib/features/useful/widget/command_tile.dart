import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommandTile extends StatelessWidget {
  const CommandTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: SelectableText(subtitle),
      trailing: InkWell(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Icon(
            Icons.copy,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
          ),
        ),
        onTap: () async => Clipboard.setData(
          ClipboardData(text: subtitle),
        ),
      ),
      minLeadingWidth: 4,
      leading: Container(
        width: 8,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
