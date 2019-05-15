import 'dart:io';
import 'dart:convert';

class SparqlQuery {
  String queryString;
  String result;

  Future<void> run() async {
    String encodedQueryString = Uri.encodeFull(queryString);
    String requestUri = "https://query.wikidata.org/sparql?query=$encodedQueryString&format=json";

    await HttpClient()
      .getUrl(Uri.parse(requestUri))
      .then((request) => request.close())
      .then((response) {
        response.transform(utf8.decoder).listen((contents) {
          this.result = contents;
        });
      });

    await null;
  }

  SparqlQuery({String queryString}) {
    this.queryString = queryString;
  }
}
