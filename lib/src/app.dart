import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/image_model.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int img = 0;
  String apikey =
      'live_38yOpCdOP4JSxIqzLEMBNZ6PlrxpvmlTgXHUaTVTPUoXmPmeJEG4CRVcjdXpsUAC';
  void obterimagem() {
    var url = Uri.https(
      'api.thecatapi.com',
      '/v1/images/search',
      {'limit': '5', 'api_key': apikey},
    );
    var req = http.Request('get', url);
    req.send().then((result) {
      if (result.statusCode == 200) {
        http.Response.fromStream(result).then((response) {
          var decodedJSON = json.decode(response.body);
          var tagObjsJson = jsonDecode(decodedJSON) as List;
          List<ImageModel> tagObjs = tagObjsJson
              .map((tagJson) => ImageModel.fromJson(tagJson))
              .toList();
          print(tagObjs);
        });
      } else {
        print('Falhou!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Gatos!!!"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            obterimagem();
          },
        ),
        body: Text('$img'),
      ),
    );
  }
}
