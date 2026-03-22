import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:conexion_astral/models/ritual.dart';
import 'package:http/http.dart' as http;

class RitualesService extends ChangeNotifier {
  final String _baseUrl =
      'conexionastralluis-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Ritual> rituales = [];

  bool isLoading = true;

  RitualesService() {
    loadRituales();
  }

  Future<List<Ritual>> loadRituales() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.https(_baseUrl, 'rituales.json');
      final resp = await http.get(url).timeout(const Duration(seconds: 10));

      if (resp.body == 'null') {
        rituales.clear();
        isLoading = false;
        notifyListeners();
        return [];
      }

      final Map<String, dynamic> ritualesMap = json.decode(resp.body);
      rituales.clear();
      ritualesMap.forEach((key, value) {
        final tempRitual = Ritual.fromJson(value);
        tempRitual.id = key;
        rituales.add(tempRitual);
      });
    } catch (e) {
      rituales.clear();
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return rituales;
  }
}
