import 'dart:convert';
import 'package:http/http.dart' as http;

class SparqlQuery {
  String queryString;

  run() async {
    String encodedQueryString = Uri.encodeFull(queryString);
    Uri requestUri = Uri.parse("https://query.wikidata.org/sparql?query=$encodedQueryString&format=json");

    http.Response response = await http.get(requestUri);
    final json = jsonDecode(response.body);
    return(json);
  }

  SparqlQuery({String queryString}) {
    this.queryString = queryString;
  }
}
