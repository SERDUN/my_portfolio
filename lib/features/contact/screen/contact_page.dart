import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/widgets/decoration/decoration.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../bloc/contacts_cubit.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ContactPage> {
  late final ContactsCubit _bloc = BlocProvider.of<ContactsCubit>(context);

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
                          .map(
                            (contact) => SizedBox(
                              width: 280,
                              height: 224,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      contact.title,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      contact.value,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              );
      },
    );
  }
}
