import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/LogoImage.dart';

final logoLinkProvider = FutureProvider<LogoImage?>((ref) async {
  final response =
      await http.get(Uri.parse('http://localhost:8000/api/showlogo/logo'));
  if (response.statusCode == 200) {
    var logo = LogoImage.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return logo;
  } else
    return null;
});
