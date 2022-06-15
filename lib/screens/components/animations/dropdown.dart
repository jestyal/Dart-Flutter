import 'package:flutter/material.dart';
import 'dart:math' as math;

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationDropDown;

  bool show = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
    _animationDropDown = CurvedAnimation(parent: _controller,curve: Curves.fastOutSlowIn);

    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              const Text(
                'Saint-Petersburg',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RotationTransition(
                turns: _animation,
                child: TextButton(
                  onPressed: () {
                    if (show == false) {
                      _controller.forward(from: 0);
                      show = true;
                    } else {
                      _controller.reverse(from: 1);
                      show = false;
                    }
                  },
                  child: const Icon(Icons.arrow_downward, color: Color(0xFF6500ca)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizeTransition(
          sizeFactor: _animationDropDown,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF6500ca)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
