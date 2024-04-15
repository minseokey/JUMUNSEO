import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jumunseo/config/routes/app_routes.dart';
import 'package:jumunseo/config/theme/app_theme.dart';
import 'package:jumunseo/shared/blocs.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//TODO: 앱 초기화
  //TODO: asdf
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  FlutterNativeSplash.remove();

  runApp(const MyApp());
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
      ),
    );
  }
}

class CompositeBlocObserver extends BlocObserver {
  final List<BlocObserver> _observers;

  CompositeBlocObserver(this._observers);

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    for (var observer in _observers) {
      observer.onChange(bloc, change);
    }
  }
}
