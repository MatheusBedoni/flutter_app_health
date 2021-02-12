import 'package:flutter/material.dart';
import 'package:flutter_app_health/Constants.dart';
import 'package:flutter_app_health/presenter/register_presenter.dart';
import 'package:flutter_app_health/view/widget/button_widget.dart';

import 'widget/text_field_widget.dart';





class  RegisterPage extends StatefulWidget {

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  RegisterPresenter _registerPresenter = new RegisterPresenter();
  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
    _registerPresenter.ctrlPeso.dispose();
    _registerPresenter.ctrlAltura.dispose();
    _registerPresenter.ctrlCpf.dispose();
    _registerPresenter.ctrlNome.dispose();
    _registerPresenter.ctrlEmail.dispose();
    _registerPresenter.ctrlTelefone.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.secondbackgroundColor,
        title: Text("Registrar"),
      ),
        body: SingleChildScrollView(
          child:  Container(
            width:  MediaQuery
                .of(context)
                .size
                .width,
            decoration: Constants.decorationBackground,
            child:  Form(
              key: _registerPresenter.key,
              child:Column(
                children: <Widget>[
                  TextFieldWidget(_registerPresenter.ctrlNome,"nome",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlEmail,"email",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlTelefone,"telefone",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlCpf,"cpf",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlDataNasc,"data_nasc",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlAltura,"altura",_registerPresenter),
                  TextFieldWidget(_registerPresenter.ctrlPeso,"peso",_registerPresenter),
                   SizedBox(height: 15.0),
                  GestureDetector(

                    onTap: () => _registerPresenter.sendForm(context),
                    child:ButtonWidget(titulo:'Adicionar')
                  )

                ],
              )
            ),
          ),
        ),
    );
  }




}