import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Butterflies extends StatefulWidget {
  const Butterflies({Key? key}) : super(key: key);

  @override
  State<Butterflies> createState() => _ButterfliesState();
}

class _ButterfliesState extends State<Butterflies> {
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
  final List<String> butterfliesDesc = <String>[
    "Крапивница (лат. Aglais urticae, Nymphalis urticae) — дневная бабочка из семейства Нимфалиды (Nymphalidae), вид рода Aglais. Видовой эпитет названия — urticae, происходит от слова urtica (крапива) и объясняется тем, что крапива — одно из кормовых растений гусениц этого вида.",
    "Павлиний глаз Inachis io (Linnaeus, 1758) - бабочка из подсемейства Настоящих нимфалид (Nymphalinae). Названа она так благодаря красивым глазчатым пятнам по вершинным углам крыльев. Глазчатое пятно - это пятно, окружённое каймой разных цветов, в отличие от глазка, кайма которого одноцветна.",
    "Капустница или белянка капустная (лат. Pieris brassicae) — дневная бабочка из семейства белянок (Pieridae). Видовой эпитет происходит от лат. Brassica — капуста, одно из кормовых растений гусениц.",
    "Голубянка алексис (лат. Glaucopsyche alexis) — бабочка семейства голубянок (Lycaenidae). Алексис (лат. Alexis) — пастух и поэт у Вергилия и Горация.",
    "Голубянка аргус, или большой аргус (Plebejus argus) — бабочка семейства Голубянки. Вид назван по имени героя греческих мифов Аргуса — сына Геи и стража Ио.",
    "Переливница ивовая, или радужница большая ивовая, или переливница большая, или ирида (лат. Apatura iris) — дневная бабочка из семейства Nymphalidae. Вид назван по имени героя греческих мифов Аргуса — сына Геи и стража Ио.",
    "Траурница (лат. Nymphalis antiopa) — вид дневных бабочек из семейства нимфалид (Nymphalidae). Русское название дано бабочке по её тёмной — «траурной» окраске. Латинский видовой эпитет antiopa связан с греческой мифологией: Антиопа — царица амазонок, взятая в плен Тесеем.",
    "Червонец альцифрон, или червонец алкифрон, или многоглазка альцифрон, или червонец фиолетовый (лат. Lycaena alciphron) — дневная бабочка из семейства голубянок. Альцифрон (Алкифрон) — знаменитый греческий ритор (II—III века н. э.)."
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          child: ListView.builder(
            itemCount: butterfliesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black12,
                border:  _selectedIndex == index ? Border.all(color: Colors.blueAccent) : Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(15),
              ),
              width: 200,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                leading: const Image(
                  image: AssetImage('assets/images/butterfly.png'),
                  width: 35,
                ),
                title: Text(
                  butterfliesList[index],
                  style: const TextStyle(fontSize: 18),
                ),
                selected: index == _selectedIndex,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Text(
              _selectedIndex == -1 ? '' : butterfliesDesc[_selectedIndex],
              style: const TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
