import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  List listOfPlaces = [
    'Saint Petersburg 1',
    'Saint Petersburg 2',
    'Saint Petersburg 3'
  ];
  List listOfPlacesDescription = [
    'Saint Petersburg 11111111',
    'Saint Petersburg 222222222',
    'Saint Petersburg 333333333'
  ];
  List listOfPlacesImages = [
    'assets/images/places/place1.jpg',
    'assets/images/places/place2.jpg',
    'assets/images/places/place3.jpg',
  ];

  ValueChanged? onSelectedPlaces;
  ValueChanged? onSelectedPlacesDescription;
  ValueChanged? onSelectedPlacesImages;

  PlaceList(this.onSelectedPlaces, this.onSelectedPlacesDescription, this.onSelectedPlacesImages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (_, index) => const Divider(color: Colors.grey),
        itemCount: listOfPlaces.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage(listOfPlacesImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        listOfPlaces[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      listOfPlacesDescription[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () => {
              onSelectedPlaces!(listOfPlaces[index]),
              onSelectedPlacesDescription!(listOfPlacesDescription[index]),
              onSelectedPlacesImages!(listOfPlacesImages[index]),
            }
          );
        },
      ),
    );
  }
}
