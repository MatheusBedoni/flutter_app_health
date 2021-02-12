import 'package:flutter/material.dart';
import 'package:flutter_app_health/Constants.dart';
import 'package:flutter_app_health/model/saude.dart';
import 'package:flutter_app_health/presenter/events_presenter.dart';


class EventsDetailsPage extends StatefulWidget {
  final Saude document;
  const EventsDetailsPage({this.document});
  @override
  EventsDetailsState createState() => EventsDetailsState();
}

class EventsDetailsState extends State<EventsDetailsPage> with TickerProviderStateMixin {
  EventsPresenter _eventsPresenter = new EventsPresenter();

  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.secondbackgroundColor,
        title: Text("Detalhes"),
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
          child: Column(
            children:<Widget> [
              SizedBox(height:  MediaQuery
                  .of(context)
                  .size
                  .height /10),
              Text(widget.document.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize:  MediaQuery.of(context).size.height/65,
                ),),

              SizedBox(height:  MediaQuery
                  .of(context)
                  .size
                  .height /20),

              Text('data e hora: '+widget.document.data_hora,
                style: TextStyle(
                  color:  Colors.black,
                  fontSize:  MediaQuery.of(context).size.height/65,
                ),),
              Text('tipo: '+widget.document.tipo,
                style: TextStyle(
                  color:  Colors.black,
                  fontSize:  MediaQuery.of(context).size.height/65,
                ),),

              SizedBox(height:  MediaQuery
                  .of(context)
                  .size
                  .height /10),
              Text(widget.document.descricao,
                style: TextStyle(
                  color: Colors.black,
                  fontSize:  MediaQuery.of(context).size.height/65,
                ),),
              SizedBox(height:  MediaQuery
                  .of(context)
                  .size
                  .height /20),


            ],
          )
        ),
      ),
    );
  }




}