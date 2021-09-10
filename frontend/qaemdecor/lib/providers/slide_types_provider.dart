import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:qaemdecor/models/SlideType.dart';
// import '../helper/constHelper.dart';

final slideTypeProvider = FutureProvider<List<SlideType>>((ref) async {
  final response =
      await http.get(Uri.parse('http://localhost:8000/api/slidetypes/'));
  if (response.statusCode == 200) {
    var slideTypeList = SlideType.getSlideTypeList(jsonDecode(response.body));
    return slideTypeList;
  } else
    return []; //cant load slide types
});
