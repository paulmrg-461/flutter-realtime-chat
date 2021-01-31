import 'package:http/http.dart' as http;
import 'package:realtime_chat/global/enviroment.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:realtime_chat/models/users_response.dart';
import 'package:realtime_chat/services/auth_service.dart';

class UsersService {
  Future<List<User>> getUsers() async {
    try {
      final resp = await http.get('${Enviroment.apiUrl}/users', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });
      final usersResponse = usersResponseFromJson(resp.body);
      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
