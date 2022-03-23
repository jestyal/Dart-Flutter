import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GiphyPage extends StatefulWidget {
  const GiphyPage({Key? key}) : super(key: key);

  @override
  _GiphyPageState createState() => _GiphyPageState();
}

class _GiphyPageState extends State<GiphyPage> {
  late String _search;
  final String _apiKey = "QTyhx6MzovH85S73K2V7iwNIUmVZRVOT";
  final int _limit = 12;

  Future<dynamic> _getGifs() async {
    Response response = await get(Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=$_apiKey&q=$_search&limit=$_limit'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load gifs');
    }
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then(print);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search gif"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search:',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 18),
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return  _createGifTable(context, snapshot);
                  } else if (snapshot.hasError) {
                    return Container();
                      // Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }
            ),
          ),
        ],
      ),
    );
  }


  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: _limit,
        itemBuilder: (context, index) {
            return GestureDetector(
              child:
                Image.network(snapshot.data['data'][index]['images']['fixed_height']['url']),
            );
        }
    );
  }
}