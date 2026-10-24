import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/contact/widgets/contact_item.dart';
import 'package:my_portfolio/features/main/main.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../bloc/contacts_cubit.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        return PageScaffold(
          child: state.contacts == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      context.l10n.contactGetInTouch,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const DecorationViewLines(),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: state.contacts!
                          .map((contact) => ContactItem(
                                title: contact.title,
                                value: contact.value,
                                onTap: openExternalUrl,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
        );
      },
    );
  }
}
