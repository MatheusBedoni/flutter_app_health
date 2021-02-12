
import 'package:flutter/material.dart';
import 'package:flutter_app_health/model/database_helper.dart';

import 'package:flutter_app_health/view/home_page.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
class EventsView {
  void navegarHomesPage(BuildContext context){}
  sendForm(BuildContext context) async{}
  String validarGenerico(String value) {}
}
class EventsPresenter implements EventsView{
  GlobalKey<FormState> key = new GlobalKey();
  final dbHelper = DatabaseHelper.instance;

  final ctrlTitulo = TextEditingController();
  final ctrlTipo= new TextEditingController();
  final ctrlDataHora = new MaskedTextController(mask: '00/00/0000 00:00');
  final ctrlDescricao = TextEditingController();


  @override
  void navegarHomesPage(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => HomePage()),
    );
  }

  @override
  String validarGenerico(String value) {
    String patttern = r'(^.[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o dado";
    }
    return null;
  }
  @override
  sendForm(BuildContext context) async {


    if (key.currentState.validate()) {
      Map<String, dynamic> row = {
        DatabaseHelper.columnTitulo : ctrlTitulo.text,
        DatabaseHelper.columnTipo:ctrlTipo.text,
        DatabaseHelper.columnData_hora:ctrlDataHora.text,
        DatabaseHelper.columnDescricao: ctrlDescricao.text,
      };
      final id = await dbHelper.insert(row,DatabaseHelper.tableSaude);
      if(id != null){
        print(id);
        navegarHomesPage(context);
      }
      key.currentState.save();
    } else {

    }
  }


}