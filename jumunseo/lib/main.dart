import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jumunseo/config/routes/app_routes.dart';
import 'package:jumunseo/config/theme/app_theme.dart';
import 'package:jumunseo/shared/blocs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//TODO: 앱 초기화
  //TODO: asdf
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  // await Future.delayed(const Duration(seconds: 2));

  FlutterNativeSplash.remove();

  initializeDateFormatting('ko', null).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp.router(
          title: '주문서',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          locale: const Locale('ko'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko'),
          ]),
    );
  }
}
