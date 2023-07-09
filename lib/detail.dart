import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final url, title, content, publishedAt, author, urlToImage;

  DetailPage(
      {this.title = "",
      this.url = "",
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Center(
          child: Text(
            "Detail",
            style: TextStyle(color: Colors.black),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  margin: EdgeInsets.all(20),
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey),
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('$content'),
                Divider(),
                Text('$author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        backgroundColor: Colors.black87,
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
