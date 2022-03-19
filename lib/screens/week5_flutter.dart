import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GenderList { male, female }


class QuestionnaireForm extends StatefulWidget {
  const QuestionnaireForm({Key? key}) : super(key: key);

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
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  'Кличка питомца:',
                  style: TextStyle(fontSize: 14.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Введите кличку питомца';
                }),
                const SizedBox(height: 10.0),

                const Text(
                  'Имя владельца:',
                  style: TextStyle(fontSize: 14.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Введите свое имя';
                }),
                const SizedBox(height: 10.0),

                const Text(
                  'Телефон:',
                  style: TextStyle(fontSize: 14.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Введите свой телефон';
                  if (!value.contains('+')) return 'Введите телефон в формате +7000000000';
                }),
                const SizedBox(height: 10.0),

                CheckboxListTile(
                  title: const Text('Сухой корм'),
                  selected: _food_dry,
                  value: _food_dry,
                  onChanged: (bool? value) {
                    setState(() {
                      _food_dry = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Влажный корм'),
                  selected: _food_wet,
                  value: _food_wet,
                  onChanged: (bool? value) {
                    setState(() {
                      _food_wet = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Натуральный корм'),
                  selected: _food_natural,
                  value: _food_natural,
                  onChanged: (bool? value) {
                    setState(() {
                      _food_natural = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),

                const Text(
                  'Пол питомца:',
                  style: TextStyle(fontSize: 14.0),
                ),
                RadioListTile(
                  title: const Text('Самец'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Самка'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),

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
                        text = 'Форма успешно заполнена';
                        color = Colors.green;
                      }

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(text),
                        backgroundColor: color,
                      ));
                    }
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            )));
  }
}
