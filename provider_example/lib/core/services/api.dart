import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_example/core/models/user.dart';

/// Procesa el [response] y devuelve el contenido, independientemente del log
/// y del status.
/// Parametros:
/// [logLabel] tiene que ser igual que el nombre del metodo en el que se llama
/// a esta funcion para que en caso de error sea facil de localizar.
/// [defaultReturn] es valor que se quiera que devuelva por defecto en caso de
/// no devolver un json. Si no se especifica, en caso de error devolvera null.
dynamic _getResponseContentJson(
    {http.Response response, String logLabel, dynamic defaultReturn}) {
  // se debe controlar la excepcion porque puede ser que la respuesta no sea
  // un json
  try {
    // independientemente del status code
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    // si la respuesta es buena se mostrara el contenido
    if (response.statusCode == 200) {
      // aunque la peticion sea exitosa la API puede devolver error
      String status = jsonResponse['estado'];
      if (status != 'failure') {
        // no todas las respuestas con exito devuelven contenido
        if (jsonResponse.containsKey('contenido')) {
          print('$logLabel | Response contenido: ${jsonResponse['contenido']}');
          return jsonResponse['contenido'];
        } else {
          print('$logLabel | Response log: ${jsonResponse['log']}');
          return jsonResponse['log'];
        }
      }
      // la API ha devuelto un error
      else {
        print('$logLabel | Response log: ${jsonResponse['log']}');
        return defaultReturn;
      }
    } else {
      // error en la peticion al servidor
      print('$logLabel | Status code: ${response.statusCode}');
      return defaultReturn;
    }
  } catch (e) {
    print('$logLabel | Exception: ${e.toString()}');
    print('$logLabel  | API response: ${response.body}');
    return defaultReturn;
  }
}

class Api {
  Future<List<User>> getUserList() async {
    final String url =
        'https://test.ingeniaweb.es/api/usuarios/obtener-listado';

    final response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    dynamic json =
        _getResponseContentJson(logLabel: 'getUserList', response: response);

    return List<User>.from(json.map((i) => User.fromJson(i)));
  }
}
