import '/main.dart';
import 'package:mysql1/mysql1.dart';

class ConectionUser {
  Future<Persona> login(String nombre, String contrasena) async {
    final con = await MySqlConnection.connect(ConnectionSettings(host: '10.0.2.2', port: 3306, user: 'root', db: 'dragonballclicker'));

    String sql = "select nombre, contrasena from partida where nombre = '" + nombre + "' and contrasena = '" + contrasena + "';";

    var resultado = await con.query(sql);

    Persona persona = new Persona(" ", " ");

    for (var row in resultado) {
      persona = Persona(row[0], row[1]);
    }

    await con.close();
    return persona;
  }

  Future<bool> register(Persona persona) async {
    final con = await MySqlConnection.connect(ConnectionSettings(host: '10.0.2.2', port: 3306, user: 'root', db: 'dragonballclicker'));

    bool comprobar = false;

    comprobar = true;

    await con.close();

    return comprobar;
  }

  Future<bool> guardarPartida(String nombre) async {
    final con = await MySqlConnection.connect(ConnectionSettings(host: '10.0.2.2', port: 3306, user: 'root', db: 'dragonballclicker'));

    bool comprobar = false;


    comprobar = true;

    await con.close();

    return comprobar;
  }

  Future<DatosPartida> cargarPartida(String nombre) async {
    final con = await MySqlConnection.connect(ConnectionSettings(host: '10.0.2.2', port: 3306, user: 'root', db: 'dragonballclicker'));
    var result = await con.query(
        "SELECT clicks, click_bonus, monedas, mejora_bola, mejora_goku, mejora_vegeta, mejora_gohan, mejora_trunks, mejora_freezer, mejora_celula, mejora_buu, num_goku, num_vegeta, num_gohan, num_trunks, num_freezer, num_celula, num_buu from partida where nombre = '" +
            nombre +
            "';");

    DatosPartida datosPartida = new DatosPartida(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    for (var row in result) {
      datosPartida = DatosPartida(
        row[0],
        row[1],
        row[2],
        row[3],
        row[4],
        row[5],
        row[6],
        row[7],
        row[8],
        row[9],
        row[10],
        row[11],
        row[12],
        row[13],
        row[14],
        row[15],
        row[16],
        row[17],
      );
    }

    await con.close();
    return datosPartida;
  }
}
