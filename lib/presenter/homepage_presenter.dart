import 'package:flutter/material.dart';
import 'package:flutter_app_health/model/database_helper.dart';
import 'package:flutter_app_health/model/saude.dart';
import 'package:flutter_app_health/model/saude_controller.dart';
import 'package:flutter_app_health/model/user_controller.dart';
import 'package:flutter_app_health/presenter/register_presenter.dart';
import 'package:flutter_app_health/view/eventos_details.dart';
import 'package:flutter_app_health/view/register_events.dart';
import 'package:flutter_app_health/view/register_user.dart';
import 'package:get/get.dart';

class HomePageView {
  Future<bool> getSaudeEvents() async {}
  Future<bool> getUser() async {}
  navegarAdicionarEvento(BuildContext context) {}
  navegarEditUser(BuildContext context) {}
  void navegarEventsPage(BuildContext context,Saude saude) {}
}

class HomePagePresenter implements HomePageView{
  var saudeListsController = Get.put(SaudeController());
  var userController = Get.put(UserController());

  final dbHelper = DatabaseHelper.instance;


  @override
  Future<bool> getSaudeEvents() async {
    return saudeListsController.getSaudeEventsList();
  }
  @override
  Future<bool> getUser() async {
    return userController.getUser();
  }

  @override
   navegarAdicionarEvento(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => RegisterEventsPage()),
    );
  }
  void navegarEventsPage(BuildContext context,Saude saude) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => EventsDetailsPage(document:saude ,)),
    );
  }
  @override
  navegarEditUser(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => RegisterPage()),
    );
  }
}