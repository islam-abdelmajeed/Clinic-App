import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/main_splash_screen.dart';
import 'package:clinic_app/modules/onboarding_screen/onboarding_screen.dart';
import 'package:clinic_app/shared/network/local/cache_helper.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:clinic_app/style/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
    systemNavigationBarColor: defaultColor,
    statusBarColor: Colors.pink[50],
    statusBarBrightness: Brightness.light,
    systemNavigationBarDividerColor: defaultColor,
  ),);
  await Firebase.initializeApp();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  runApp(MyApp(onBoarding: onBoarding,));
}

class MyApp extends StatefulWidget {

  final bool onBoarding;
 MyApp({this.onBoarding});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('ar' ,'');
  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      supportedLocales: [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale:_locale,

      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if(locale.languageCode == currentLang.languageCode){
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      home: widget.onBoarding == null || widget.onBoarding==false? OnBoardingScreen() : MainSplashScreen(),
    );
  }
}


