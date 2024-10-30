// ignore_for_file: prefer_const_constructors

import '/conectionUser.dart';
import '/main.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  //Atributos que recogeremos del usuario en el Sing in
  String nombre = "";
  String password = "";
  String password2 = "";
  bool comprobar = true;

  String mensajeError = "";

  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo jugador"),
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
              height: 390,
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
                      decoration: InputDecoration(labelText: "   Nombre de usuario"),
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
                  //Container Correo Electrónico
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
                  //Container Contraseña
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    height: 80,
                    color: Colors.orange[100],
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "   Repite Contraseña"),
                      obscureText: true,
                      onSaved: (value) {
                        password2 = value!;
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

                  //Container Botón START, para empezar juego.
                  Container(margin: EdgeInsets.only(top: 20), width: 100, height: 50, color: Colors.white, child: TextButton(onPressed: () => recogerDatos(context), child: Text("ACEPTAR"))),
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

      if (password != password2) {
        setState(() {
          mensajeError = "Las contraseñas no coinciden";
        });

        return "Las contraseñas no coinciden";
      }

      Persona persona = new Persona(nombre, password);

      ConectionUser conection = new ConectionUser();
      try {
        comprobar = await conection.register(persona);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Usuario registrado con éxito.",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ));
      } on Exception catch (_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "ERROR: Ya existe un usuario con ese nombre.",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ));
      }

      if (comprobar) {
        Navigator.of(context).pushNamed("/rutaLogin", arguments: persona);
      } else {
        setState(() {
          mensajeError = "Las contraseñas no coinciden";
        });
      }
    }
  }
}
