import 'package:wikidata_client/wikidata_client.dart';

main() async {

  String queryString = """
SELECT ?item ?itemLabel 
WHERE 
{
  ?item wdt:P31 wd:Q146.
}
""";

  final result = await SparqlQuery(queryString: queryString).run();
  print(result);
}
