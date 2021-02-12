
import 'package:flutter/material.dart';
import 'package:flutter_app_health/constants.dart';
import 'package:flutter_app_health/model/saude.dart';



class ListSaudeWidget extends StatelessWidget{
  final int index;
  final Saude saudeEvento;
  ListSaudeWidget({this.index,this.saudeEvento});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:<Widget> [
        Center(
          child:Container(
            margin:  EdgeInsets.all(15.0),
            padding: EdgeInsets.all(10.0) ,
            height:  MediaQuery
                .of(context)
                .size
                .height /7,
            width: MediaQuery
                .of(context)
                .size
                .width /1.1,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFd3d3d3).withOpacity(0.5),
                  blurRadius: 4.0, // has the effect of softening the shadow
                  spreadRadius: 4.0, // has the effect of extending the shadow

                )
              ],
              color:Constants.backgroundColor,
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height /15,
            ),
            child:Text(saudeEvento != null ? saudeEvento.titulo : '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF000000),
                fontSize:  MediaQuery.of(context).size.height/65,
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height /10,
            ),
            child:Text(saudeEvento != null ? saudeEvento.data_hora : '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF000000),
                fontSize:  MediaQuery.of(context).size.height/65,
              ),
            ),
          ),
        ),
      ],
    );

  }


}