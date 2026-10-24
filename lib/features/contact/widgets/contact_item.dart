import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/style/style.dart';

/// One contact channel: label, the address and an arrow. Email opens the
/// mail client, everything else opens the link.
class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final ContactsModel contact;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final shown = contact.value.replaceFirst(RegExp(r'^https?://(www\.)?'), '');

    return Semantics(
      link: true,
      label: '${contact.title}: ${contact.value}',
      child: Material(
        color: palette.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          side: BorderSide(color: palette.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => openExternalUrl(contact.link),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 22, 20, 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.title.toUpperCase(),
                        style: textTheme.labelSmall?.copyWith(letterSpacing: 1.3, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(shown, style: textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(Icons.arrow_outward_rounded, size: 20, color: palette.accent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
