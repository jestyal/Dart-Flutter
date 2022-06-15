import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF6500ca)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8), // Border width
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: 'piter',
                  child: AnimatedContainer(
                    // height: show ? 150 : 0,
                    width: 100,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(50), // Image radius
                        child: const FadeInImage(
                          placeholder: AssetImage('assets/images/loadingicon.gif'),
                          image: AssetImage('assets/images/places/place5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Text(
                  "Go to Piter",
                  style: TextStyle(fontSize: 18, color: Color(0xFF6500ca)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ImageDetail(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ImageDetail extends StatelessWidget {
  const ImageDetail({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF6500ca)),
      body: const Center(
        child: SizedBox(
          height: 300,
          child: Hero(
            tag: 'piter',
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loadingicon.gif'),
              image: AssetImage('assets/images/places/place5.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}