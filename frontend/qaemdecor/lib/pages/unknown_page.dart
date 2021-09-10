import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';



class UnknownPage extends HookConsumerWidget {
    static const routeName = 'unknownPage';

  const UnknownPage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.red,
    );
  }
}