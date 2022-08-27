import 'package:coin_lore/splash/splashScreen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode? _themeMode;
  @override
  void initState() {
    getTheme();
    super.initState();
  }
  void getTheme()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? flag = preferences.getBool('theme');
    setState(() {
      _themeMode = flag == true ? ThemeMode.dark : ThemeMode.light;
    });
  }
  void changeTheme(ThemeMode themeMode,bool flag) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('theme', flag);
    setState(() {
      _themeMode = themeMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[210],
          brightness: Brightness.dark,
          accentColor: Colors.orange),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[20],
          brightness: Brightness.light,
          accentColor: Colors.orange),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
