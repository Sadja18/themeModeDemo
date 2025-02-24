import 'package:flutter/material.dart';
import 'package:theme_mode_demo/theme/dark_theme.dart';
import 'package:theme_mode_demo/theme/light_theme.dart';

import 'package:theme_mode_demo/views/widgets/stepper_v1/stepper_v1.dart';
import 'package:theme_mode_demo/views/widgets/stepper_v2/stepper_v2.dart';

void main() {
  runApp(const MyApp());
}

Settings appSettings = Settings();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: appSettings,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: appSettings.getTheme,
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(
            //     seedColor: Colors.purple,
            //   ),
            // ),
            home: const MyHomePage(title: "Dark Theme Sample"),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode theme = ThemeMode.dark;

  int _selectedTabIndex = 0;

  void _onTabChanged(int selectedTabIndex) {
    setState(() {
      _selectedTabIndex = selectedTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ThemeData,
        title: Text(widget.title),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Hello user",
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 2.0,
        ),
        // child:
        child: _selectedTabIndex == 0
            ? StepperV1()
            : _selectedTabIndex == 1
                ? StepperV2()
                : Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Text("Hello"),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("Hello"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Hello"),
                        ),
                        const Text(
                          'Toggle the switch to change the Theme',
                        ),
                        Switch(
                            value: appSettings.getTheme == ThemeMode.dark,
                            onChanged: (isDark) {
                              if (isDark) {
                                appSettings.setTheme(ThemeMode.dark);
                              } else {
                                appSettings.setTheme(ThemeMode.light);
                              }
                            }),
                        Text(
                          appSettings.getTheme == ThemeMode.dark
                              ? 'Dark'
                              : 'Light',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTabChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Stepper V1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Stepper V2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widgets',
          ),
        ],
      ),
    );
  }
}

class Settings extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  ThemeMode get getTheme => theme;

  void setTheme(ThemeMode theme) {
    this.theme = theme;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
