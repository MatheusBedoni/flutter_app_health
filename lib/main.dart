import 'package:flutter/material.dart';
import 'package:flutter_app_health/view/home_page.dart';
import 'package:flutter_app_health/view/register_user.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'presenter/register_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'epHealth',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<MyHomePage> {
  GlobalKey<FormState> _key = new GlobalKey();
  String nome, email, celular;
  int id = 0;

  RegisterPresenter _registerPresenter = new RegisterPresenter();


  @override
  void initState() {
    super.initState();
    getId();

    new Future.delayed(
        const Duration(milliseconds: 6000),
            () => getNavigation(context));

  }

  getId() {
    _registerPresenter.loadId().then((value) {
      setState(() {
        id = value;
        print(id);
      });
    });
  }

  getNavigation(BuildContext context){
    if(id == null || id == 0 ){
      print('ssdsd');
      Navigator.pushReplacement(
        context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => RegisterPage()),
      );

    }else{
      Navigator.pushReplacement(
        context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => HomePage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: Constants.decorationBackground,
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
            child:Text('epHealth',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF000000),
                fontSize:  MediaQuery.of(context).size.height/55,
              ),
            ),
          ),
        ),


      ],
    );;
  }
}