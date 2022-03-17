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
                  style: TextStyle(fontSize: 10.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите кличку питомца';
                }),
                const SizedBox(height: 10.0),

                const Text(
                  'Имя владельца:',
                  style: TextStyle(fontSize: 10.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свое имя';
                }),
                const SizedBox(height: 10.0),

                const Text(
                  'Телефон:',
                  // 'Контактный E-mail:',
                  style: TextStyle(fontSize: 10.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свой телефон';
                  // if (!value.contains('@')) return 'Это не E-mail';
                }),
                const SizedBox(height: 10.0),

                const Text(
                  'Порода питомца:',
                  style: TextStyle(fontSize: 10.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите породу питомца';
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
                  style: TextStyle(fontSize: 10.0),
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



                // CheckboxListTile(
                //     value: _agreement,
                //     title: Text('Я ознакомлен' +
                //         (_gender == null
                //             ? '(а)'
                //             : _gender == GenderList.male
                //                 ? ''
                //                 : 'а') +
                //         ' с документом "Согласие на обработку персональных данных" и даю согласие на обработку моих персональных данных в соответствии с требованиями "Федерального закона О персональных данных № 152-ФЗ".'),
                //     onChanged: (bool? value) =>
                //         setState(() => _agreement = value!)),


                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Color color = Colors.red;
                      String text;

                      if (_gender == null)
                        text = 'Выберите свой пол';
                      // else if (_agreement == false)
                      //   text = 'Необходимо принять условия соглашения';
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
