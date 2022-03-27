import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/catForm/formSuccess.dart';

enum GenderList { male, female }

class CatForm extends StatefulWidget {
  const CatForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _food_dry = false;
  bool _food_wet = false;
  bool _food_natural = false;
  // bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Форма'), centerTitle: true),
          body: Container(
              padding: EdgeInsets.all(10.0),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Кличка питомца:',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) return 'Введите кличку питомца';
                      }),
                      SizedBox(height: 10.0),

                      Text(
                        'Имя владельца:',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) return 'Введите свое имя';
                      }),
                      SizedBox(height: 10.0),

                      Text(
                        'Телефон:',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) return 'Введите свой телефон';
                        if (!value.contains('+')) return 'Введите телефон в формате +7000000000';
                      }),
                      SizedBox(height: 10.0),

                      CheckboxListTile(
                        title: Text('Сухой корм'),
                        selected: _food_dry,
                        value: _food_dry,
                        onChanged: (bool? value) {
                          setState(() {
                            _food_dry = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Влажный корм'),
                        selected: _food_wet,
                        value: _food_wet,
                        onChanged: (bool? value) {
                          setState(() {
                            _food_wet = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Натуральный корм'),
                        selected: _food_natural,
                        value: _food_natural,
                        onChanged: (bool? value) {
                          setState(() {
                            _food_natural = value!;
                          });
                        },
                      ),
                      SizedBox(height: 10.0),

                      Text(
                        'Пол питомца:',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      RadioListTile(
                        title: Text('Самец'),
                        value: GenderList.male,
                        groupValue: _gender,
                        onChanged: (GenderList? value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('Самка'),
                        value: GenderList.female,
                        groupValue: _gender,
                        onChanged: (GenderList? value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                      SizedBox(height: 10.0),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Color color = Colors.red;
                            String text;

                            if (_gender == null)
                              text = 'Выберите свой пол';
                            else if (_food_dry == false && _food_wet == false && _food_natural == false)
                              text = 'Необходимо выбрать корм';
                            else {
                              Navigator.pushNamed(
                                context,
                                FormSuccess().routeName,
                              );
                            }
                          }
                        },
                        child: Text('Сохранить'),
                      ),
                    ],
                  ))
          )
        ));
  }
}
