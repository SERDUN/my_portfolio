import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/pages/contact/bloc/bloc.dart';
import 'package:my_portfolio/layers/presenter/pages/contact/bloc/state.dart';

import 'contact_us.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white54,
        body:
            BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
          return state.contacts == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: ContactUs(
                    contactsModel: state.contacts!,
                  ),
                );
        }));
  }
}
