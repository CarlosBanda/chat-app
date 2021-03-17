import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/usario.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:http/http.dart' as http;

class UsuariosServices {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Enviroments.apiUrl}/usuarios', headers: {
        'Coutent-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
