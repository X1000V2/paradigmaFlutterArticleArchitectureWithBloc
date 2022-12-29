import 'package:flutter_bloc_plus_freezed/data/services/model/generate_deck_response.dart';
import 'package:flutter_bloc_plus_freezed/data/services/model/get_cards_response.dart';
import 'package:flutter_bloc_plus_freezed/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_plus_freezed/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class CardsService {
  Future<String> generateDeck() async {
    String serviceUrl = "${EndPoints.deckServiceUrl}new/shuffle/?deck_count=1";
    Uri url = Uri.parse(serviceUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var generateDeckResponse = GenerateDeckResponse.fromJson(response.body);
      return generateDeckResponse.deckId;
    } else {
      return "";
    }
  }

  Future<GetCardsResponse?> getCardsFromService(DeckEntity deck) async {
    String serviceUrl = "${EndPoints.deckServiceUrl}${deck.deckId}/draw/?count=5";
    Uri url = Uri.parse(serviceUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var getCardsResponse = GetCardsResponse.fromJson(response.body);
      return getCardsResponse;
    } else {
      return null;
    }
  }

// Future<List<Card>> getCardsFromService() {
//   var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
//
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
}
