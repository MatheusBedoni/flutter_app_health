import 'package:flutter/material.dart';
import 'package:flutter_app_health/presenter/events_presenter.dart';

class TextFieldEventsWidget extends StatelessWidget{
  final TextEditingController value ;
  String chave;
  EventsPresenter eventsPresenter;


  TextFieldEventsWidget(this.value,this.chave,this.eventsPresenter);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0) ,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFd3d3d3).withOpacity(0.5),
            blurRadius: 4.0, // has the effect of softening the shadow
            spreadRadius: 4.0, // has the effect of extending the shadow

          )
        ],
        borderRadius: BorderRadius.all(
            Radius.circular(10)
        ),
        color:  Colors.white,
      ),
      child:TextFormField(
        controller: value,
          validator:eventsPresenter.validarGenerico,
        decoration:  InputDecoration(hintText: chave,fillColor: Colors.white),
      ),
    );
  }

}