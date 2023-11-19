import 'package:bhagavat_geeta/JsonDecode.dart';
import 'package:bhagavat_geeta/SplashScreen.dart';
import 'package:bhagavat_geeta/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('appTheme') ?? false;
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider(isDark: isDark),),
          ChangeNotifierProvider(create: (context) => ChapterJsonDecodeProvider(),),
          ChangeNotifierProvider(create: (context) => ShlokJsonDecodeProvider(),),
          ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).isDark) ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
