import 'dart:convert';

import 'package:flutter/services.dart';

Future<void> main() async {
  var data = await getDataService();
  print(data);
}

Future<Map<String, dynamic>> getDataService() async {
  var load = await rootBundle.loadString('assets/dataset/json_data.json');
  Map<String, dynamic> data = json.decode(load);
  return data;
}
