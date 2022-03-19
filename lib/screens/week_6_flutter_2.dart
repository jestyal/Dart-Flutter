import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> butterflies = <String>[
  'Крапивница',
  'Павлиний глаз',
  'Капустница',
  'Голубянка алексис',
  'Голубянка аргус',
  'Переливница большая',
  'Траурница',
  'Червонец фиолетовый',
];
final List<String> butterfliesDesc = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
];


class ButterfliesList extends StatelessWidget {
  const ButterfliesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            centerTitle: true,
          ),
          body: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: butterflies.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(butterflies[index], style: const TextStyle(fontSize: 22)),
                    leading: const Image(
                      image: AssetImage('assets/images/butterfly.png'),
                      width: 20,
                      height: 20,
                    ),
                    // trailing: const Icon(Icons.phone),
                    // subtitle: Text("Works in ${butterfliesDesc[index]}")
                );
              }
          )),
    );
  }
}
