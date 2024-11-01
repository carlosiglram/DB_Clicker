// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import '/conectionUser.dart';
import '/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login2 createState() => Login2();
}

class Login2 extends State<Login> {
  //Atributos que recogeremos del usuario en el Login
  static String nombre = "";
  String password = "";
  String mensajeError = "";
  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dragon Ball Clicker"),
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/bg.jpg"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Form(
            key: formkey,
            //Containers para cada dato que le pediremos al usuario
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              width: 500,
              height: 300,
              color: Colors.orange[200],
              child: Column(
                children: [
                  //Container Nombre
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    height: 80,
                    color: Colors.orange[100],
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "   Nombre"),
                      onSaved: (value) {
                        nombre = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio";
                        }
                      },
                    ),
                  ),
                  //Container Password
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    height: 80,
                    color: Colors.orange[100],
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "   Contraseña"),
                      obscureText: true,
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio";
                        }
                      },
                    ),
                  ),

                  if (mensajeError.isNotEmpty)
                    Text(
                      mensajeError,
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  //Botones
                  Row(
                    children: [
                      //Botón para empezar juego.
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 60), width: 100, height: 50, color: Colors.white, child: TextButton(onPressed: () => recogerDatos(context), child: Text("START"))),
                      //Botón para registrarse.
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 30),
                          width: 100,
                          height: 50,
                          color: Colors.white,
                          child: TextButton(onPressed: () => registrarJugador(context), child: Text("SIGN IN"))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Función del botón "START", nos lleva a la ventana principal.
  recogerDatos(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      ConectionUser con = ConectionUser();

      Persona persona = await con.login(nombre, password);

      if (persona.nombre != " ") {
        DatosPartida datosPartida = await con.cargarPartida(persona.nombre);

        Navigator.of(context).pushNamed("/rutaPrincipal", arguments: datosPartida);
      } else {
        setState(() {
          mensajeError = "Usuario o contraseña incorrectos";
        });
      }
    }
  }

  //Función del botón "SING IN", nos lleva a la ventana de regitro de usuario.
  registrarJugador(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaSignIn");
  }
}
