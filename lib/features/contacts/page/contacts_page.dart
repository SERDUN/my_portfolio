import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:my_portfolio/app/contacts/contacts.dart';
import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../widgets/contact_card.dart';

/// Contacts: the statement, a short description and one card per channel.
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        final contacts = state.contacts;
        return SemanticId(
          identifier: contactsScreenId,
          child: PageScaffold(
            child: LoadStatusView(
              status: state.status,
              hasData: contacts.isNotEmpty,
              onRetry: context.read<ContactsCubit>().load,
              builder: (context) => ContentWidth(
                padding: EdgeInsets.only(top: isMobile ? 32 : 72, bottom: 96),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Eyebrow(l10n.shell_navContacts),
                    const SizedBox(height: 10),
                    Text(l10n.contacts_title, style: isMobile ? textTheme.headlineLarge : textTheme.displayMedium),
                    const SizedBox(height: 14),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Text(
                        l10n.contacts_description,
                        style: textTheme.bodyMedium?.copyWith(color: context.palette.muted),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ResponsiveGrid(children: [for (final contact in contacts) ContactCard(contact: contact)]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
