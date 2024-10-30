import '/logros.dart';
import '/signin.dart';

import '/bola.dart';
import '/login.dart';
import '/mejoras.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'DragonBall Clicker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey.shade800,
        ),
      ),
      initialRoute: '/rutaLogin',
      routes: {
        '/rutaSignIn': (BuildContext context) => SignIn(),
        '/rutaLogin': (BuildContext context) => Login(),
        '/rutaPrincipal': (BuildContext context) => Bola(),
        '/rutaMejoras': (BuildContext context) => Mejoras(),
        '/rutaLogros': (BuildContext context) => Logros(),
      },
    );
  }
}

class Persona {
  String nombre = "";
  String contrasena = "";

  Persona(String nombre, String contrasena) {
    this.nombre = nombre;
    this.contrasena = contrasena;
  }
}

//Permite cargar los datos cuando te logeas
class DatosPartida {
  int clicks = 0;
  int clicksbonus = 0;
  double contador = 0;
  //Variables de mejoras de cada personaje
  int mejoraBola = 1;
  int mejoraGoku = 0;
  int mejoraVegeta = 0;
  int mejoraGohan = 0;
  int mejoraTrunks = 0;
  int mejoraCelula = 0;
  int mejoraFreezer = 0;
  int mejoraBuu = 0;
  //Variables de contadores de cada personaje
  int gokus = 0;
  int vegetas = 0;
  int gohans = 0;
  int trunks = 0;
  int freezers = 0;
  int celulas = 0;
  int buus = 0;

  DatosPartida(
    int clicks,
    int clicksbonus,
    double contador,
    int mejoraBola,
    int mejoraGoku,
    int mejoraVegeta,
    int mejoraGohan,
    int mejoraTrunks,
    int mejoraCelula,
    int mejoraFreezer,
    int mejoraBuu,
    int gokus,
    int vegetas,
    int gohans,
    int trunks,
    int freezers,
    int celulas,
    int buus,
  ) {
    this.clicks = clicks;
    this.clicksbonus = clicksbonus;
    this.contador = contador;
    this.mejoraBola = mejoraBola;
    this.mejoraGoku = mejoraGoku;
    this.mejoraVegeta = mejoraVegeta;
    this.mejoraGohan = mejoraGohan;
    this.mejoraTrunks = mejoraTrunks;
    this.mejoraCelula = mejoraCelula;
    this.mejoraFreezer = mejoraFreezer;
    this.mejoraBuu = mejoraBuu;
    this.gokus = gokus;
    this.vegetas = vegetas;
    this.gohans = gohans;
    this.trunks = trunks;
    this.freezers = freezers;
    this.celulas = celulas;
    this.buus = buus;
  }
}
