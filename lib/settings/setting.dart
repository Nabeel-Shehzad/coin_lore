import 'package:coin_lore/main.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _checked = false;

  @override
  void initState() {
    getTheme();
    super.initState();
  }

  void getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if(preferences.getBool('theme') == null){
        _checked = false;
      }else {
        _checked = preferences.getBool('theme') as bool;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Text(
        'Settings',
        style: TextStyle(fontSize: 60),
      ),
      content: Center(
        child: Column(
          children: [
            ToggleSwitch(
                checked: _checked,
                onChanged: (v) {
                  setState(() {
                    _checked = v;
                    if(_checked){
                      MyApp.of(context)?.changeTheme(ThemeMode.dark,_checked);
                    }else{
                      MyApp.of(context)?.changeTheme(ThemeMode.light, _checked);
                    }
                  });
                },
              content: Text(_checked ? 'Dark' : 'Light'),
            ),
          ],
        ),
      ),
    );
  }
}
