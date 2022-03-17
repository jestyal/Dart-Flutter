import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextSizeWidget extends StatefulWidget {
  const TextSizeWidget({Key? key}) : super(key: key);

  @override
  State<TextSizeWidget> createState() => _TextSizeWidgetState();
}

class _TextSizeWidgetState extends State<TextSizeWidget> {
  double initialFontSize = 18;

  void increment() {
    setState(() {
      initialFontSize++;
    });
  }

  void decrement() {
    setState(() {
      initialFontSize--;
    });
  }

  void changeFontSize(newFont) {
    setState(() {
      initialFontSize = newFont;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Text Size Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    decrement();
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 60),
                  ),
                  child: const Text('-'),
                ),
                TextField(
                  controller: TextEditingController()..text = initialFontSize.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: "Размер шрифта",
                  ),
                  onChanged: (String font) {
                    double newFont = double.parse(font);
                    changeFontSize(newFont);
                  },
                ),
                TextButton(
                  onPressed: () {
                    increment();
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 60),
                  ),
                  child: const Text('+'),
                ),

                Text(
                    "Винни-пух и пятачок отдыхали на веточке дуба. Пух сказал: ”Интересно, как долго мы ещё будем здесь торчать?” Пятачок ответил: ” Я думаю, ещё лет десять.",
                    style: TextStyle(
                        fontSize: initialFontSize,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
