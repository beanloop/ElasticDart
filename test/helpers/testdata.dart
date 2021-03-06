library testdata;

import 'dart:convert';
import 'package:http/http.dart' as http;

var client = new http.Client();

setUpTestData() async {
  await client.delete('http://127.0.0.1:9200/_all/');
  var body = [
    {"index": {"_index": "my_movies", "_type": "movies", "_id": "1"}},
    {"name": "The hunger games", "year": "2012"},
    {"index": {"_index": "my_other_movies", "_type": "movies", "_id": "1"}},
    {"name": "The hunger games", "year": "2012"},
    {"index": {"_index": "my_movies", "_type": "movies", "_id": "2"}},
    {"name": "Titanic", "year": "1997"},
    {"index": {"_index": "my_movies", "_type": "movies", "_id": "3"}},
    {"name": "Annabelle", "year": "2014"},
    {"index": {"_index": "my_movies", "_type": "movies", "_id": "4"}},
    {"name": "Star Wars: Episode I - The Phantom Menace", "year": "1999"}
  ];
  await client.post('http://127.0.0.1:9200/_bulk/',
      body: body.map(JSON.encode).join('\n') + '\n');
}

cleanUpTestData() async {
  var body = [
    {"delete": {"_index": "my_movies", "_type": "movies", "_id": "1"}},
    {"delete": {"_index": "my_other_movies", "_type": "movies", "_id": "1"}},
    {"delete": {"_index": "my_movies", "_type": "movies", "_id": "2"}},
    {"delete": {"_index": "my_movies", "_type": "movies", "_id": "3"}},
    {"delete": {"_index": "my_movies", "_type": "movies", "_id": "4"}},
  ];
  await client.post('http://127.0.0.1:9200/_bulk/',
      body: body.map(JSON.encode).join('\n') + '\n');
}
