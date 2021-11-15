import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'ListTheme.dart';

class appBar extends AppBar{

final BuildContext context;
appBar({required this.context,Key? key}): super(key: key);


@override
 Widget get leading => DayNightSwitcher(
 isDarkModeEnabled:
 context.watch<ListTheme>().isDark == true ? true : false,
 onStateChanged: (isDarkModeEnabled) {
context.read<ListTheme>().change();
});



}