import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchBtnState(
              isSwitched: isSwitched,
              child: Stack(
                children: <Widget>[
                  FittedBox(
                    child: PersonImg(),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: const BoxDecoration(
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
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchBtnState extends InheritedWidget {
  const SwitchBtnState({
    Key? key,
    required this.isSwitched,
    required Widget child,
  }) : super(key: key, child: child);

  final bool isSwitched;

  static SwitchBtnState of(BuildContext context) {
    final SwitchBtnState? result =
        context.dependOnInheritedWidgetOfExactType<SwitchBtnState>();
    return result!;
  }

  @override
  bool updateShouldNotify(SwitchBtnState oldWidget) =>
      isSwitched != oldWidget.isSwitched;
}

class PersonImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isSwitched = SwitchBtnState.of(context);
    return Image(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      image: _isSwitched.isSwitched
          ? const AssetImage("assets/images/mistique.jpg")
          : const AssetImage("assets/images/poison-ivy.jpg"),
      fit: BoxFit.fitHeight,
    );
  }
}

class PersonDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isSwitched = SwitchBtnState.of(context);
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            _isSwitched.isSwitched == true ? "Mystique" : "Poison Ivy",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Text(
              _isSwitched.isSwitched == true
                  ? "Raven Darkholme"
                  : "Pamela Lillian Isley",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'Roboto'),
            ),
          ),
          Text(
            _isSwitched.isSwitched == true
                ? "Mystique is a mutants who are born with superhuman abilities, she can mimic of any person."
                : "Poison Ivy is an eco-terrorist villain of Batman with total control over plants.",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
