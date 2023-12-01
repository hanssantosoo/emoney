import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

class CardsStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _cardsFile async {
    final path = await _localPath;
    return File('$path/hadwin_available_cards.json');
  }

  Future<Map<String, dynamic>> get randomCard async {
    var _availableCards = (await readAvailableCards())['availableCards'];

    return _availableCards[Random().nextInt(_availableCards.length)];
  }

  Future<Map<String, dynamic>> readAvailableCards() async {
    try {
      final file = await _cardsFile;

      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      return {"localDBError": "unable to parse data"};
    }
  }

  void updateAvailableCards(Map<String, dynamic> cardData) async {
    final file = await _cardsFile;

    final contents = await file.readAsString();

    var decodedFile = jsonDecode(contents);
    decodedFile['availableCards'].add(cardData);

    file
        .writeAsString(jsonEncode(decodedFile))
        .then((value) => print("new card added"));
  }
