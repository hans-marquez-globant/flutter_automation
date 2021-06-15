import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('alert_header'),
        title: const Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('back_button'),
        child: Icon(Icons.arrow_back),
        onPressed: (){
         Navigator.pop(context);
        },
      ),
    );
  }
}