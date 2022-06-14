import 'package:flutter/material.dart';

import 'dropdown.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        backgroundColor: const Color(0xFF6500ca),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(8), // Border width
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100), // Image radius
                    child: const FadeInImage(
                      placeholder: AssetImage('assets/images/loadingicon.gif'),
                      image: AssetImage('assets/images/places/place6.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const DropdownWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
