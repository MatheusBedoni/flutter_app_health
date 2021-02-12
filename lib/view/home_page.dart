import 'package:flutter/material.dart';
import 'package:flutter_app_health/model/saude_controller.dart';
import 'package:flutter_app_health/presenter/homepage_presenter.dart';
import 'package:flutter_app_health/view/widget/drawer_widget.dart';
import 'package:flutter_app_health/view/widget/list_saude_envents.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'widget/button_widget.dart';





class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomePagePresenter _homePagePresenter = new HomePagePresenter();

  @override
  void initState() {
    super.initState();
    _homePagePresenter.getSaudeEvents();
    _homePagePresenter.getUser();

  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:GetBuilder<SaudeController>(
        builder: (_) =>
            DrawerWidget(document:_homePagePresenter,)
      ) ,
      appBar: AppBar(
        backgroundColor: Constants.secondbackgroundColor,
        title: Text("Home Page"),
      ),
      body:   Container(
          width:  MediaQuery
              .of(context)
              .size
              .width,
          decoration: Constants.decorationBackground,
          child:Column(
              children: <Widget>[
                GetBuilder<SaudeController>(
                  builder: (_) =>
                      Flexible(
                          flex:1,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:_homePagePresenter.saudeListsController.listSaude.length,
                              itemBuilder: (BuildContext context, int index) {
                                return new GestureDetector(onTap: (){
                                   _homePagePresenter.navegarEventsPage(context, _homePagePresenter.saudeListsController.listSaude[index]);
                                },
                                child:ListSaudeWidget(index:index,saudeEvento:_homePagePresenter.saudeListsController.listSaude[index])) ;
                              })
                      ),
                ),
                GestureDetector(

                    onTap: () => _homePagePresenter.navegarAdicionarEvento(context),
                    child:ButtonWidget(titulo:'Adicionar')
                )

              ]
          )
      ),
    );
  }



}