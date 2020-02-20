import 'package:flutter/material.dart';
import 'package:my_shared_preferences/src/pages/home_page.dart';
import 'package:my_shared_preferences/src/pages/settings_page.dart';
import 'package:my_shared_preferences/src/shared_prefs/shared_prefs.dart';

class DrawerMenu extends StatelessWidget {

  final String currentPage;
  DrawerMenu(this.currentPage);
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createMenu('Home', Icons.home, HomePage.routeName, context),
          _divider(),
          _createMenu('People', Icons.people, '', context),
          _divider(),
          _createMenu('Party Mode', Icons.party_mode, '', context),
          _divider(),
          _createMenu('Setting', Icons.settings, SettingsPage.routeName, context),
        ],
      ),
    );
  }

  Widget _createMenu(
      String title, IconData icon, String route, BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Colors.blue),
      onTap: () {
        if(route != currentPage){
          Navigator.pushReplacementNamed(context, route);
          prefs.lastPage = route;
        }
        else
          Navigator.pop(context);
      },
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/drawer_header.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  Divider _divider() {
    return Divider(
      color: Colors.black45,
    );
  }
}
