import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:conexion_astral/models/consejo.dart';
import 'package:http/http.dart' as http;

class ConsejosService extends ChangeNotifier {
  final String _baseUrl =
      'conexionastralluis-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Consejo> consejos = [];

  bool isLoading = true;

  ConsejosService() {
    loadConsejos();
  }

  Future<List<Consejo>> loadConsejos() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.https(_baseUrl, 'consejos.json');
      final resp = await http.get(url).timeout(const Duration(seconds: 10));

      if (resp.body == 'null') {
        consejos.clear();
        isLoading = false;
        notifyListeners();
        return [];
      }

      final Map<String, dynamic> consejosMap = json.decode(resp.body);
      consejos.clear();

      consejosMap.forEach((key, value) {
        final tempConsejo = Consejo.fromJson(value);
        tempConsejo.id = key;
        consejos.add(tempConsejo);
      });
    } catch (e) {
      consejos.clear();
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return consejos;
  }
}
