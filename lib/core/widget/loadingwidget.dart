import 'package:clean_archeticture/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_archeticture/injection_container.dart' as de;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences sh = de.sl();
    bool isDark = sh.getBool('isDark') ?? false;
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: isDark? secondaryDarkColor:secondaryColor,
            )),
      ),
    );
  }
}
