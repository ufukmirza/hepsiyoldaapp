import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/tabview/tabViewClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder < ThemeMode > (
        valueListenable: _notifier,
        builder: (_, mode, __)
    {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: Scaffold(
              body: tabViewClass(),
              appBar:AppBar(
              leading: DayNightSwitcher(
                  isDarkModeEnabled:mode==ThemeMode.light ? false : true,
                  onStateChanged: (isDarkModeEnabled) {_notifier.value=mode==ThemeMode.light ? ThemeMode.dark : ThemeMode.light;}
                                ),
                           ),
                         ),
                     );
     });
   }
  }
