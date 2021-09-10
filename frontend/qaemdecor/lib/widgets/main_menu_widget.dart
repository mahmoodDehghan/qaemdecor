import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/slidepagemenuitem.dart';
import '../providers/slide_pages_menu_provider.dart';

class MainMenuWidget extends HookConsumerWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue menuItems = ref.watch(SlidePageMenuProvider);
    final selectedIndex = useState(1);
    return Container(
      width: double.infinity,
      height: 60,
      child: menuItems.when(
        data: (data) {
          List<SlidePageMenuItem> itemsList = data;
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: itemsList.map<Widget>((SlidePageMenuItem item) {
                return TextButton(
                  onPressed: () {
                    selectedIndex.value = item.index;
                  },
                  key: ValueKey(item.index),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    primary: item.index == selectedIndex.value
                        ? Colors.indigo
                        : Colors.black87,
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'IranSans',
                        fontWeight: FontWeight.bold),
                  ),
                  child: Text(item.title),
                );
              }).toList(),
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
      ),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Color(0xFFFFD5A3),
          Color(0xFFFBC5A8),
          Color(0xFFE79042),
          Color(0xFFCB9875),
        ],
      )),
    );
  }
}
