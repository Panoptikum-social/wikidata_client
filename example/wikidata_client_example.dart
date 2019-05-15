import 'package:wikidata_client/wikidata_client.dart';

Future<void> main() async {

  String queryString = """
SELECT ?item ?itemLabel 
WHERE 
{
  ?item wdt:P31 wd:Q146.
}
""";

  SparqlQuery query = SparqlQuery(queryString: queryString);
  await query.run();
  await print (query.result);
}
