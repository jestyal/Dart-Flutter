import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  final routeName = '/place-page';

  late String selectedPlace;
  late String selectedPlaceInfo;
  late String selectedPlaceImg;

  PlaceItem(this.selectedPlace, this.selectedPlaceInfo, this.selectedPlaceImg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace),
        // title: Text("1111"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 340,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                // image: AssetImage("assets/images/places/place1.jpg"),
                image: AssetImage(selectedPlaceImg),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              selectedPlace,
              // "Title",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              selectedPlaceInfo,
              // "Description",
              style: TextStyle(fontSize: 18),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back'),
          ),

          // Container(
          //   width: 80,
          //   height: 80,
          //   margin: const EdgeInsets.only(right: 20),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     border: Border.all(
          //       color: Colors.grey,
          //       width: 1,
          //     ),
          //     borderRadius: BorderRadius.circular(50.0),
          //     image: const DecorationImage(
          //       image: AssetImage('assets/images/places/place1.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }
}
