import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButterfliesList extends StatefulWidget {
  const ButterfliesList({Key? key}) : super(key: key);

  @override
  State<ButterfliesList> createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList> {
  final List<String> butterfliesList = <String>[
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
    "1Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "2Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "3Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "4Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "5Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "6Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "7Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "8Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Butterflies"),
          centerTitle: true,
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: butterfliesList.length,
                itemExtent: 185,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  title: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/butterfly.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text(butterfliesList[index],
                              style: const TextStyle(fontSize: 18)))
                    ],
                  ),
                  // Text(butterfliesList[index], style: const TextStyle(fontSize: 20)),
                  selected: index == _selectedIndex,
                  selectedTileColor: Colors.black12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                  _selectedIndex == -1 ? '' : butterfliesDesc[_selectedIndex],
                  style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
