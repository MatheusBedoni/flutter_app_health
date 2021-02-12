import 'package:get/get_state_manager/get_state_manager.dart';

import 'database_helper.dart';
import 'saude.dart';


class SaudeController extends GetxController {
  List<Saude> listSaude = new List<Saude>();
  final dbHelper = DatabaseHelper.instance;

  Future<bool> getSaudeEventsList() async {
    final allSaudeEvents = await dbHelper.query();
    listSaude = allSaudeEvents.map((model) => Saude.fromMap(model)).toList();
    print('tamanho'+listSaude.length.toString());
    print('titulo: '+listSaude[0].titulo.toString());
    update();
    return true;
  }
}