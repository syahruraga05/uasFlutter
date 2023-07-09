import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text('News App', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _get[index]['urlToImage'] != null
                  ? Image.network(
                      _get[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_get[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_get[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => DetailPage(
                    url: _get[index]['url'],
                    title: _get[index]['title'],
                    content: _get[index]['content'],
                    urlToImage: _get[index]['urlToImage'],
                    author: _get[index]['author'],
                    publishedAt: _get[index]['publishedAt'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&apiKey=a5b04cb5cf58472db91c507ab0fbf184"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
