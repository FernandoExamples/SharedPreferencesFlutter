import 'package:flutter/material.dart';
import 'package:my_shared_preferences/src/shared_prefs/shared_prefs.dart';
import 'package:my_shared_preferences/src/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final PreferenciasUsuario prefs = new PreferenciasUsuario();
  bool _secondColor;
  int _genere;
  String _name;

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _genere = prefs.genere;
    _secondColor = prefs.secondaryColor;
    _name = prefs.userName;

    _textController = TextEditingController(
      text: _name,      
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setings'),
        backgroundColor: (prefs.secondaryColor ? Colors.teal : Colors.blue),
      ),
      drawer: DrawerMenu(SettingsPage.routeName),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    var titleStyle = TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold);

    return ListView(
      children: <Widget>[

        Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Settings', style: titleStyle),
        ),

        Divider(),

        SwitchListTile(
          value: _secondColor, 
          title: Text('Color Secundario'),
          onChanged: (value){ 
            setState(() {
              _secondColor = value;
              prefs.secondaryColor = value;
            });            
          },
        ),

        RadioListTile(
          title: Text('Masculino'),
          value: 1, 
          groupValue: _genere, 
          onChanged: _saveGenere,
        ),

        RadioListTile(
          title: Text('Femenino'),
          value: 2, 
          groupValue: _genere, 
          onChanged: _saveGenere, 
        ),

        Divider(),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Nombre',
              helperText: 'Nombre de la persona usando el telefono',
            ),
            onChanged: (value){
              prefs.userName = value;
            },
          ),
        ),

      ],
    );

  }

  _saveGenere(int value)  {
    prefs.genere = value;

    setState(() {
      _genere = value;      
    });
  }
}
