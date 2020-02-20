import 'package:flutter/material.dart';
import 'package:my_shared_preferences/src/shared_prefs/shared_prefs.dart';
import 'package:my_shared_preferences/src/widgets/drawer.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final PreferenciasUsuario prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: (prefs.secondaryColor ? Colors.teal : Colors.blue),
      ),
      drawer: DrawerMenu(routeName),
      body: _createBody(),    
    );
  }

  Widget _createBody() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Color secundario: ${prefs.secondaryColor}'),
        Divider(),
        Text('Genero: ${prefs.genere}'),
        Divider(),
        Text('Nombre Usuario: ${prefs.userName}'),
        Divider(),
      ],
    );

  }
}
