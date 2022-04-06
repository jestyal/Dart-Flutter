import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  String nickname;
  String name;
  String description;

  static const List<String> _personNicknameList = <String>[
    "Poison Ivy",
    "Mystique",
  ];
  static const List<String> _personNameList = <String>[
    "Pamela Lillian Isley",
    "Raven Darkholme",
  ];
  static const List<String> _personDescList = <String>[
    "Poison Ivy is an eco-terrorist villain of Batman with total control over plants.",
    "Mystique is a mutants who are born with superhuman abilities, she can mimic of any person.",
  ];

  Person(this.nickname, this.name, this.description);

  static List<String> getNicknameList() {
    return _personNicknameList;
  }

  static List<String> getNameList() {
    return _personNameList;
  }

  static List<String> getDescList() {
    return _personDescList;
  }

// late String selectedPlace;
// late String selectedPlaceInfo;
// late String selectedPlaceImg;
//
// PlaceItem(this.selectedPlace, this.selectedPlaceInfo, this.selectedPlaceImg, {Key? key}) : super(key: key);

}

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isSwitched = false;

  // @override
  // void initState() {
  //   var _personNicknameList = Person.getNicknameList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("DC or Marvel Universe?"),
      //   centerTitle: true,
      // ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                FittedBox(
                  child: PersonImg(),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("DC", style: TextStyle(fontSize: 20)),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.red[100],
                              activeColor: Colors.red,
                              inactiveTrackColor: Colors.blueAccent[100],
                              inactiveThumbColor: Colors.blueAccent,
                            ),
                            const Text("Marvel",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: PersonDescription(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PersonImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      image: const AssetImage('assets/images/mistique.jpg'),
      fit: BoxFit.fitHeight,
    );
  }
}

class PersonDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          Text(
            "Mystique",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 10),
            child: Text(
              "Raven Darkholme",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'Roboto'),
            ),
          ),
          Text(
            "Mystique is a mutants who are born with superhuman abilities, she can mimic of any person.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
