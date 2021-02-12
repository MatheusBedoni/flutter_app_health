import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  String titulo;

  ButtonWidget({this.titulo});
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
        color:  Colors.blue,
      ),
      child:Center(
        child:Text(titulo, style: TextStyle(
          fontWeight: FontWeight.bold,
          color:  Color(0xFFfff9f9),
          fontSize:  MediaQuery.of(context).size.height/65,
        ),) ,
      )
    );
  }

}