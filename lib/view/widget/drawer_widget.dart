import 'package:flutter/material.dart';
import 'package:flutter_app_health/presenter/homepage_presenter.dart';

import '../../constants.dart';
import 'button_widget.dart';




class DrawerWidget extends StatelessWidget{
  final HomePagePresenter document;
  DrawerWidget({this.document});
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery
            .of(context)
            .size
            .width /2,
        color: Constants.secondbackgroundColor,
        padding: EdgeInsets.all( MediaQuery
            .of(context)
            .size
            .width /10,) ,
        child:Column(
          children:<Widget> [
            Text(document.userController.user.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFFfff9f9),
                fontSize:  MediaQuery.of(context).size.height/65,
              ),),

            SizedBox(height:  MediaQuery
                .of(context)
                .size
                .height /20),

            Text('Peso: '+document.userController.user.peso,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFFfff9f9),
                fontSize:  MediaQuery.of(context).size.height/65,
              ),),
            Text('Altura: '+document.userController.user.altura,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFFfff9f9),
                fontSize:  MediaQuery.of(context).size.height/65,
              ),),

            SizedBox(height:  MediaQuery
                .of(context)
                .size
                .height /20),
            GestureDetector(

                onTap: () => document.navegarEditUser(context),
                child:ButtonWidget(titulo:'Editar')
            )
            

          ],
        )
    )
    ;

  }


}