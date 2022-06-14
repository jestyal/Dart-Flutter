import 'package:flutter/material.dart';
import '../gallery_screen.dart';

class ManualSection extends StatefulWidget {
  final List<String>? imageUrls;

  const ManualSection({
    required this.imageUrls,
  });

  @override
  State<ManualSection> createState() => _ManualSectionState();
}

class _ManualSectionState extends State<ManualSection> with SingleTickerProviderStateMixin {
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _heightAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );

    _heightAnimation.addListener(() {
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    if (show == false) {
                      _controller.forward();
                      show = true;
                    } else {
                      _controller.reverse();
                      show = false;
                    }
                  },
                  child: Text(show ? 'Hide Guest' : 'Show Guest'),
                ),
                OutlinedButton(
                  child: const Text('Show Gallery'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GalleryScreen(widget.imageUrls),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: _heightAnimation.value,
              width: 150,
              child: Image.network(widget.imageUrls![0]),
            ),
          ],
        ),
      ),
    );
  }
}
