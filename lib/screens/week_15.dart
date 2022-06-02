import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({Key? key}) : super(key: key);

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(translation.title),
        actions: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: const Text('EN'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  backgroundColor: Colors.pinkAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              TextButton(
                child: const Text('RU'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  backgroundColor: Colors.pinkAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              TextButton(
                child: const Text('PT'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  backgroundColor: Colors.pinkAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _cardItem(
            context,
            translation.winnieName,
            "https://static.wikia.nocookie.net/sojuzmultfilm/images/2/29/%D0%92%D0%B8%D0%BD%D0%BD%D0%B8-%D0%9F%D1%83%D1%85.png/revision/latest?cb=20210214171857&path-prefix=ru",
          ),
          _cardItem(
            context,
            translation.pigName,
            "https://citaty.info/files/portraits/unnamed_3_0.jpg",
          ),
          _cardItem(
            context,
            translation.rabbitName,
            "https://i.pinimg.com/originals/1c/d4/24/1cd4248d344cf45b84f4dc8c74141839.jpg",
          ),
        ],
      ),
    );
  }



  Widget _cardItem(BuildContext context, String name, String img) {
    return               Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.network(img),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Text('Jan 17, 2022'),
                const SizedBox(width: 10),
                Text('4 Jars - USD20'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
