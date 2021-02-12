import 'package:flutter_app_health/model/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'database_helper.dart';
import 'saude.dart';


class UserController extends GetxController {
  User user;
  final dbHelper = DatabaseHelper.instance;

  Future<bool> getUser() async {
    final allUsers = await dbHelper.getUser();
    List<User>  listUser = allUsers.map((model) => User.fromMap(model)).toList();
    user = listUser[0];
    print(user.nome);
    update();
    return true;
  }
}