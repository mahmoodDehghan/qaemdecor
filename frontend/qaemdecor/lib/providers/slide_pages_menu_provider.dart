import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/slidepagemenuitem.dart';

final SlidePageMenuProvider =
    FutureProvider<List<SlidePageMenuItem>>((ref) async {
  final response =
      await http.get(Uri.parse('http://localhost:8000/api/slidepages/'));
  if (response.statusCode == 200) {
    var slidePageMenuItemList = SlidePageMenuItem.getSlidePageMenuList(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return slidePageMenuItemList;
  } else
    return [];
});
