
import 'package:flutter/material.dart';
import 'package:my_shared_preferences/src/pages/home_page.dart';
import 'package:my_shared_preferences/src/pages/settings_page.dart';
import 'package:my_shared_preferences/src/shared_prefs/shared_prefs.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  PreferenciasUsuario prefs = new PreferenciasUsuario();
  await prefs.initPrefs();


  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias de Usuario',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}