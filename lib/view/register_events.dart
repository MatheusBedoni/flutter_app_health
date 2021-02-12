import 'package:flutter/material.dart';
import 'package:flutter_app_health/Constants.dart';
import 'package:flutter_app_health/presenter/events_presenter.dart';
import 'package:flutter_app_health/view/widget/text_field_events_widget.dart';

import 'widget/button_widget.dart';






class RegisterEventsPage extends StatefulWidget {

  @override
  RegisterEventsPageState createState() => RegisterEventsPageState();
}

class RegisterEventsPageState extends State<RegisterEventsPage> with TickerProviderStateMixin {
  EventsPresenter _eventsPresenter = new EventsPresenter();
  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
    _eventsPresenter.ctrlTitulo.dispose();
    _eventsPresenter.ctrlDataHora.dispose();
    _eventsPresenter.ctrlDescricao.dispose();
    _eventsPresenter.ctrlTipo.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.secondbackgroundColor,
        title: Text("Evento"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){ _eventsPresenter.navegarHomesPage(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child:  Container(
          width:  MediaQuery
              .of(context)
              .size
              .width,
          height:  MediaQuery
              .of(context)
              .size
              .height,
          decoration: Constants.decorationBackground,
          child:  Form(
              key: _eventsPresenter.key,
              child:Column(
                children: <Widget>[
                  TextFieldEventsWidget(_eventsPresenter.ctrlTitulo,"titulo",_eventsPresenter),
                  TextFieldEventsWidget(_eventsPresenter.ctrlDataHora,"data e hora",_eventsPresenter),
                  TextFieldEventsWidget(_eventsPresenter.ctrlTipo,"tipo",_eventsPresenter),
                  TextFieldEventsWidget(_eventsPresenter.ctrlDescricao,"descricao",_eventsPresenter),

                  SizedBox(height: 15.0),
                  GestureDetector(

                      onTap: () => _eventsPresenter.sendForm(context),
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