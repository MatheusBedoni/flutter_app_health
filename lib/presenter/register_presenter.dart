
import 'package:flutter/material.dart';
import 'package:flutter_app_health/model/database_helper.dart';
import 'package:flutter_app_health/model/user_controller.dart';
import 'package:flutter_app_health/view/home_page.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView {
  String validarNome(String value) {}
  String validarCelular(String value){}
  String validarGenerico(String value){}
  String validarEmail(String value){}
  Future<int> loadId() async {}
  static Future<bool> saveId(int id) async {}
  sendForm(BuildContext context) async{}
}
class RegisterPresenter implements RegisterView{
  GlobalKey<FormState> key = new GlobalKey();
  final dbHelper = DatabaseHelper.instance;
  var userController = Get.put(UserController());


  final ctrlNome = TextEditingController();
  final ctrlCpf =  new MaskedTextController(mask: '000.000.000-00');
  final ctrlEmail = new TextEditingController();
  final ctrlTelefone = new MaskedTextController(mask: '(00)00000-0000');
  var ctrlDataNasc =  new MaskedTextController(mask: '00/00/0000');
  var ctrlPeso = new TextEditingController();
  var ctrlAltura= new MaskedTextController(mask: '0.00');

  RegisterPresenter(){
    if(userController.user != null){
      ctrlNome.text = userController.user.nome;
      ctrlEmail.text = userController.user.email;
      ctrlAltura.text = userController.user.altura;
      ctrlPeso.text = userController.user.peso;
      ctrlTelefone.text = userController.user.telefone;
      ctrlDataNasc.text = userController.user.data_nasc;
      ctrlCpf.text = userController.user.cpf;
    }
  }




  @override
  String validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }
  @override
  String validarCelular(String value) {
    if (value.length == 0) {
      return "Informe o celular";
    }
    return null;
  }
  @override
  String validarGenerico(String value) {

    if (value.length == 0) {
      return "Informe o dado";
    }
    return null;
  }
  @override
  String validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }
  @override
  static Future<bool> saveId(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt("id",id);
  }
  @override
  Future<int> loadId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("id");
  }

  @override
   navegarHomesPage(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => HomePage()),
    );
  }

  @override
  sendForm(BuildContext context) async {
    if (key.currentState.validate()) {

      if(userController.user == null){
        Map<String, dynamic> row = {
          DatabaseHelper.columnNome : ctrlNome.text,
          DatabaseHelper.columnTelefone:ctrlTelefone.text,
          DatabaseHelper.columnEmail:ctrlEmail.text,
          DatabaseHelper.columnCpf: ctrlCpf.text,
          DatabaseHelper.columnDataNacimento:ctrlDataNasc.text,
          DatabaseHelper.columnAltura:ctrlAltura.text,
          DatabaseHelper.columnPeso:ctrlPeso.text
        };
        final id = await dbHelper.insert(row,DatabaseHelper.table);
        if(id != null){
          print(id);
          saveId(id);
          navegarHomesPage(context);
        }
      }else{
        Map<String, dynamic> row = {
          DatabaseHelper.columnId : userController.user.id,
          DatabaseHelper.columnNome : ctrlNome.text,
          DatabaseHelper.columnTelefone:ctrlTelefone.text,
          DatabaseHelper.columnEmail:ctrlEmail.text,
          DatabaseHelper.columnCpf: ctrlCpf.text,
          DatabaseHelper.columnDataNacimento:ctrlDataNasc.text,
          DatabaseHelper.columnAltura:ctrlAltura.text,
          DatabaseHelper.columnPeso:ctrlPeso.text
        };
        final id = await dbHelper.update(row);
        if(id != null){
          print(id);
          saveId(id);
          navegarHomesPage(context);
        }
      }


      key.currentState.save();
    }
  }


}