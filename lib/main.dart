import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'core/app_environment_keys.dart';
import 'di/injection.dart';
import 'layers/domain/usecase/config/update_local_config_use_case.dart';
import 'layers/domain/usecase/contacts/get_contacts_use_case.dart';
import 'layers/domain/usecase/projects/get_project_by_id_use_case.dart';
import 'layers/domain/usecase/projects/get_projects_use_case.dart';
import 'layers/domain/usecase/user/get_user_use_case.dart';
import 'layers/presenter/common/style/app_theme.dart';
import 'layers/presenter/features/bio/bloc/bloc.dart';
import 'layers/presenter/features/contact/bloc/bloc.dart';
import 'layers/presenter/features/contact/bloc/event.dart';
import 'layers/presenter/features/project/bloc/bloc.dart';
import 'layers/presenter/features/projects/bloc/bloc.dart';
import 'layers/presenter/app/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  await configureDependencies(AppEnvironmentKey.dev);
  await EasyLocalization.ensureInitialized();
  runApp(const DataProvider());
}

class DataProvider extends StatelessWidget {
  const DataProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InfoBloc>(
            create: (BuildContext context) => InfoBloc(di<GetUserUseCase>()),
          ),
          BlocProvider<ProjectsBloc>(
            create: (BuildContext context) =>
                ProjectsBloc(di<GetProjectsUseCase>()),
          ),
          BlocProvider<ProjectDetailsBloc>(
            create: (BuildContext context) =>
                ProjectDetailsBloc(di<GetProjectByIdUseCase>()),
          ),
          BlocProvider<ContactsBloc>(
            create: (BuildContext context) =>
                ContactsBloc(di<GetContactsUseCase>())
                  ..add(InitContactsEvent()),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: const [
            Locale.fromSubtags(languageCode: "en"),
            Locale.fromSubtags(languageCode: "uk"),
          ],
          startLocale: const Locale.fromSubtags(languageCode: 'uk'),
          path: 'assets/translations',
          useOnlyLangCode: true,
          child: MyApp(),
        ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "Dmitro Serdun",
      theme: CustomTheme.lightTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          debugLog: false,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
