import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/widgets/decoration/decoration.dart';
import 'package:my_portfolio/features/contact/widgets/contact_item.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../bloc/contacts_cubit.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        return state.contacts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    context.l10n.contactGetInTouch,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const DecorationViewLines(),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: state.contacts!
                          .map((contact) => ContactItem(
                                title: contact.title,
                                value: contact.value,
                                onTap: openLink,
                              ))
                          .toList(),
                    ),
                  )
                ],
              );
      },
    );
  }

  void openLink(String link) async {
    Uri? uri = Uri.tryParse(link);
    if (uri != null) {
      await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'Could not launch $link';
    }
  }
}
