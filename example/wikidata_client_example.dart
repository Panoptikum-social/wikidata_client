import 'package:wikidata_client/wikidata_client.dart';

main() async {

  String queryString = """
SELECT ?item ?itemLabel 
WHERE 
{
  ?item wdt:P31 wd:Q146.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],de".}
}
""";

  final result = await SparqlQuery.itemsByPropertyandValue(property: "P31", value: "Q146").run();
  List items = result["results"]["bindings"];
  items.forEach((json){
    print(json["item"]["value"]);
    print(json["itemLabel"]["value"]);
  });
}
