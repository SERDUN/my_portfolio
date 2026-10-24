import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/bio/bloc/bio_cubit.dart';
import 'package:my_portfolio/features/main/main.dart';
import 'package:my_portfolio/localization/localization.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioCubit, BioState>(
      builder: (context, state) {
        return PageScaffold(
          child: AnimatedOpacity(
            opacity: state.user != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 64),
                      NameIntro(
                        firstName: state.user?.firstName,
                        secondName: state.user?.secondName,
                      ),
                      PillButton(
                        label: context.l10n.buttonDownloadCv,
                        variant: PillButtonVariant.outline,
                        onPressed: () => openExternalUrl(state.user?.cv),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height / 2,
                    minWidth: double.infinity,
                  ),
                  child: AboutMe(
                    skills: state.skills ?? [],
                    aboutMe: state.user?.intro ?? "",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
