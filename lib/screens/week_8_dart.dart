import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Butterfly {
  String name;
  String description;

  static const List<String> _butterflies = <String>[
    'Крапивница',
    'Павлиний глаз',
    'Капустница',
    'Голубянка алексис',
    'Голубянка аргус',
    'Переливница большая',
    'Траурница',
    'Червонец фиолетовый',
  ];
  static const List<String> _butterfliesDesc = <String>[
    "Крапивница (лат. Aglais urticae, Nymphalis urticae) — дневная бабочка из семейства Нимфалиды (Nymphalidae), вид рода Aglais. Видовой эпитет названия — urticae, происходит от слова urtica (крапива) и объясняется тем, что крапива — одно из кормовых растений гусениц этого вида.",
    "Павлиний глаз Inachis io (Linnaeus, 1758) - бабочка из подсемейства Настоящих нимфалид (Nymphalinae). Названа она так благодаря красивым глазчатым пятнам по вершинным углам крыльев. Глазчатое пятно - это пятно, окружённое каймой разных цветов, в отличие от глазка, кайма которого одноцветна.",
    "Капустница или белянка капустная (лат. Pieris brassicae) — дневная бабочка из семейства белянок (Pieridae). Видовой эпитет происходит от лат. Brassica — капуста, одно из кормовых растений гусениц.",
    "Голубянка алексис (лат. Glaucopsyche alexis) — бабочка семейства голубянок (Lycaenidae). Алексис (лат. Alexis) — пастух и поэт у Вергилия и Горация.",
    "Голубянка аргус, или большой аргус (Plebejus argus) — бабочка семейства Голубянки. Вид назван по имени героя греческих мифов Аргуса — сына Геи и стража Ио.",
    "Переливница ивовая, или радужница большая ивовая, или переливница большая, или ирида (лат. Apatura iris) — дневная бабочка из семейства Nymphalidae. Вид назван по имени героя греческих мифов Аргуса — сына Геи и стража Ио.",
    "Траурница (лат. Nymphalis antiopa) — вид дневных бабочек из семейства нимфалид (Nymphalidae). Русское название дано бабочке по её тёмной — «траурной» окраске. Латинский видовой эпитет antiopa связан с греческой мифологией: Антиопа — царица амазонок, взятая в плен Тесеем.",
    "Червонец альцифрон, или червонец алкифрон, или многоглазка альцифрон, или червонец фиолетовый (лат. Lycaena alciphron) — дневная бабочка из семейства голубянок. Альцифрон (Алкифрон) — знаменитый греческий ритор (II—III века н. э.)."
  ];

  Butterfly(this.name, this.description);

  static List<Butterfly> getList() {
    var _buttList = <Butterfly>[];
    for (int i = 0; i < _butterflies.length; i++) {
      _buttList.add(Butterfly(_butterflies[i], _butterfliesDesc[i]));
    }
    return _buttList;
  }

  static bool isNameValid(String name) {
    return _butterflies.contains(name);
  }

  static List<String> getHelpList() {
    return _butterflies;
  }
}

class Butterflies extends StatefulWidget {
  const Butterflies({Key? key}) : super(key: key);

  @override
  State<Butterflies> createState() => _ButterfliesState();
}

class _ButterfliesState extends State<Butterflies> {
  int _selectedIndex = -1;
  final _controller = TextEditingController();

  var _butterflyList = <Butterfly>[];
  String _description = "";

  int _getIndex(String name) {
    if (Butterfly.isNameValid(name)) {
      for (Butterfly b in _butterflyList) {
        if (b.name == name) return _butterflyList.indexOf(b);
      }
    }
    return -1;
  }

  @override
  void initState() {
    _butterflyList = Butterfly.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter butterfly name",
                // for the Help list
                suffixIcon: PopupMenuButton(
                  //при выборе бабочки
                  onSelected: (String value) {
                    setState(() {
                      _controller.text = value;
                      _selectedIndex = _getIndex(value);
                      _description = _butterflyList[_selectedIndex].description;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                  itemBuilder: (BuildContext context) {
                    //get Help list
                    var _items = Butterfly.getHelpList();
                    //список элементов для PopupMenuButton
                    return _items.map((String value) {
                      return PopupMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList();
                  },
                ),
              ),
              onSubmitted: (String value) {
                setState(() {
                  _selectedIndex = _getIndex(value);
                  if (_selectedIndex != -1) {
                    _description = _butterflyList[_selectedIndex].description;
                  } else {
                    _description = "There's no such butterfly";
                  }
                });
              }),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 80,
          child: ListView.builder(
            itemCount: _butterflyList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black12,
                border: _selectedIndex == index
                    ? Border.all(color: Colors.blueAccent)
                    : Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(15),
              ),
              width: 200,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    _description = _butterflyList[index].description;
                  });
                },
                leading: const Image(
                  image: AssetImage('assets/images/butterfly.png'),
                  width: 35,
                ),
                title: Text(
                  _butterflyList[index].name,
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
              // _selectedIndex == -1 ? '' : _description,
              _description,
              style: const TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
