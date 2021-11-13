import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/tabview/tabViewClass.dart';
import 'package:provider/provider.dart';

import 'core/ListTheme.dart';
import 'features/entry/SingView.dart';
import 'features/router/RouterDart.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder < ThemeMode > (
//         valueListenable: _notifier,
//         builder: (_, mode, __)
//     {
//       return MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData.light(),
//           darkTheme: ThemeData.dark(),
//           themeMode: mode,
//           home: Scaffold(
//               body: tabViewClass(),
//               appBar:AppBar(
//               leading: DayNightSwitcher(
//                   isDarkModeEnabled:mode==ThemeMode.light ? false : true,
//                   onStateChanged: (isDarkModeEnabled) {_notifier.value=mode==ThemeMode.light ? ThemeMode.dark : ThemeMode.light;}
//                                 ),
//                            ),
//                          ),
//                      );
//      });
//    }
//   }

void main() => runApp(MultiProvider(
      providers: [
        //Provider<UserService>(create: (context) => UserService()),
        //ChangeNotifierProvider<User>(create: (context) => User(context)),
        ChangeNotifierProvider<ListTheme>(create: (context) => ListTheme())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: context.watch<ListTheme>().isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        onGenerateRoute: RouterDart.generateRoute,
        initialRoute: homeRoute,
        home: SignView());
  }
}
