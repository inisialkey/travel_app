import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/destination_model.dart';

const cacheAllDestinationKey = 'all_destination';

abstract class DestinationLocalDataSource {
  Future<List<DestinationModel>> getAll();
  Future<bool> cacheAll(List<DestinationModel> list);
}

class DestinationLocalDataSourceImpl implements DestinationLocalDataSource {
  final SharedPreferences pref;

  DestinationLocalDataSourceImpl(this.pref);

  @override
  Future<bool> cacheAll(List<DestinationModel> list) async {
    List<Map<String, dynamic>> listMap = list.map((e) => e.toJson()).toList();
    String allDestination = jsonEncode(listMap);
    return pref.setString(cacheAllDestinationKey, allDestination);
  }

  @override
  Future<List<DestinationModel>> getAll() async {
    String? allDestination = pref.getString(cacheAllDestinationKey);
    if (allDestination != null) {
      List<Map<String, dynamic>> listMap =
          List<Map<String, dynamic>>.from(jsonDecode(allDestination));
      List<DestinationModel> list =
          listMap.map((e) => DestinationModel.fromJson(e)).toList();
      return list;
    } else {
      throw CachedException();
    }
  }
}
