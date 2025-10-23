import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManager {

  static const String _key = "recent_searches";

  Future<void> addSearchItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> searches = prefs.getStringList(_key) ?? [];

    searches.remove(item);

    // Insert at 0 index
    searches.insert(0, item);

    // Keep only latest 5
    if (searches.length > 5) {
      searches = searches.sublist(0, 5);
    }

    await prefs.setStringList(_key, searches);
  }

  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// Clear all recent searches
  Future<void> clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }


  Future<void> setValue(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<dynamic> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    final entityValue = prefs.getString('entity');
    await prefs.clear();
    if (entityValue != null) {
      await prefs.setString('entity', entityValue);
    }
  }

  // static const String _key = "pendingAttendance";
  //
  // Future<void> addAttendance(MarkAttendanceRequestModel newModel) async {
  //   List<MarkAttendanceRequestModel> list = await getAttendanceList();
  //   list.add(newModel);
  //   await saveAttendanceList(list);
  // }
  //
  // Future<void> saveAttendanceList(List<MarkAttendanceRequestModel> list) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String> jsonList = list.map((model) => jsonEncode(model.toJson())).toList();
  //   await prefs.setStringList(_key, jsonList);
  // }
  //
  // Future<List<MarkAttendanceRequestModel>> getAttendanceList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String>? jsonList = prefs.getStringList(_key);
  //   if (jsonList == null) return [];
  //
  //   return jsonList.map((jsonString) => MarkAttendanceRequestModel.fromJson(jsonDecode(jsonString))).toList();
  // }
  //
  // Future<void> removeAttendance(MarkAttendanceRequestModel modelToRemove) async {
  //   List<MarkAttendanceRequestModel> list = await getAttendanceList();
  //   list.removeWhere((model) => jsonEncode(model.toJson()) == jsonEncode(modelToRemove.toJson())); // Compare JSON
  //   await saveAttendanceList(list);
  // }
}
