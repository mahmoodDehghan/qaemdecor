import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qaemdecor/qaemapp.dart';

void main() {
  runApp(
    ProviderScope(
      child: QaemDecorApp(),
    ),
  );
}
