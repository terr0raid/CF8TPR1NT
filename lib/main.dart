import 'package:cf8tpr1nt/core/constants/app/app_constants.dart';
import 'package:cf8tpr1nt/core/init/cache/locale_manager.dart';
import 'package:cf8tpr1nt/core/init/language/language_manager.dart';
import 'package:cf8tpr1nt/core/init/navigation/navigation_route.dart';
import 'package:cf8tpr1nt/core/init/navigation/navigation_service.dart';
import 'package:cf8tpr1nt/core/init/provider/application_provider.dart';
import 'package:cf8tpr1nt/core/init/provider/theme_provider.dart';
import 'package:cf8tpr1nt/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        fallbackLocale: LanguageManager.instance.enLocale,
        path: ApplicationConstants.LANG_ASSET_PATH,
        child: const MainApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  await dotenv.load(fileName: 'assets/env/.env');
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    await SystemNavigator.pop();
  }

  await EasyLocalization.ensureInitialized();
  await LocaleManager.preferencesInstance();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      // navigatorObservers: AnalytcisManager.instance.observer,
    );
  }
}
