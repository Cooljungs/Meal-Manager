import 'package:flutter/material.dart';
import 'package:meal_manager/utils/providers.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool colorTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Einstellungen")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Akzent-Farbe ändern"),
            subtitle: Text("Dit is' 'ne richtig coole Sache, alla!"),
            onTap: () => setState(() => colorTileExpanded = !colorTileExpanded),
            trailing: Padding(
                padding: EdgeInsets.only(right: 16),
                child: colorTileExpanded
                    ? Icon(Icons.keyboard_arrow_up_rounded,
                        color: Theme.of(context).accentColor)
                    : Icon(Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).colorScheme.onPrimary)),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            height: colorTileExpanded ? 80 : 0,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Theme.of(context).cardColor,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Provider.of<ColorProvider>(context)
                      .secondaryColorList
                      .length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: Provider.of<ColorProvider>(context)
                    .secondaryColorList
                    .length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Material(
                        color: Color(Provider.of<ColorProvider>(context)
                            .secondaryColorList[index]),
                        child: InkWell(
                          child: Color(Provider.of<ColorProvider>(context)
                                      .secondaryColorList[index]) ==
                                  Theme.of(context).accentColor
                              ? Icon(Icons.done_rounded)
                              : Container(),
                          onTap: () {
                            Provider.of<ColorProvider>(context, listen: false)
                                .setSecondaryColor(Provider.of<ColorProvider>(
                                        context,
                                        listen: false)
                                    .secondaryColorList[index]);
                          },
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SwitchListTile(
            title: Text("Chat einblenden"),
            subtitle: Text("Viel zu hoher Online-Traffic"),
            value: Provider.of<DisplayProvider>(context).displayChat,
            onChanged: (value) =>
                Provider.of<DisplayProvider>(context, listen: false).swapChat(),
          ),
        ],
      ),
    );
  }
}
