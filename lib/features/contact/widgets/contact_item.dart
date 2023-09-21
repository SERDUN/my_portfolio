import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;

  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 224,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onTap(value),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              SelectableText(
                value,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
