import 'package:coin_lore/settings/setting.dart';
import 'package:fluent_ui/fluent_ui.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text('CoinLore', style: TextStyle(fontSize: 20),)
      ),
      content: NavigationBody(
        index: index,
        children: [
          Settings(),
        ],
      ),
      pane: NavigationPane(
        selected: index,
        displayMode: PaneDisplayMode.auto,
        onChanged: (newIndex){
          setState(() {
            index = newIndex;
          });
        },
        footerItems: [
          PaneItem(icon: Icon(FluentIcons.settings),
          title: Text('Settings')),

        ]
      ),
    );
  }
}
