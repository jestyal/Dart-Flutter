import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormSuccess extends StatelessWidget {
  const FormSuccess({Key? key}) : super(key: key);

  final routeName = "/form-success";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Form success"),
            centerTitle: true,
            backgroundColor: Colors.indigoAccent,
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Success!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('back'),
                    ),
                  ),
                ),
              ])),
    );
  }
}
