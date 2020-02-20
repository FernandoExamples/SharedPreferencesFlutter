import 'package:my_shared_preferences/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final _singletown = PreferenciasUsuario._();
  SharedPreferences _prefs;


  factory PreferenciasUsuario(){
    return _singletown;
  }

  PreferenciasUsuario._();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //geters y setters para las preferencias de usuario 

  //genero
  get genere{
    return _prefs.getInt('genere') ?? 1;
  }

  set genere(int genere){
    _prefs.setInt('genere', genere);
  }

  //color secundario
  get secondaryColor{
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value){
    _prefs.setBool('secondaryColor', value);
  }

  //nombre
  get userName{
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value){
    _prefs.setString('userName', value);
  }

  get lastPage{
    return _prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }
}