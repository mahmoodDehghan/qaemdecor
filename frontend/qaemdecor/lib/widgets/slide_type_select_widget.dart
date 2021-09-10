import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qaemdecor/models/SlideType.dart';
import '../providers/slide_types_provider.dart';

class SlideTypeSelectWidget extends HookConsumerWidget {
  const SlideTypeSelectWidget() : super();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue types = ref.watch(slideTypeProvider);
    return types.when(
      data: (data) {
        List<SlideType> typeslist = data;
        return DropdownButton<SlideType>(
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          value: typeslist[1],
          onChanged: (SlideType? value) {
            print(value);
          },
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          items: typeslist.map<DropdownMenuItem<SlideType>>((SlideType item) {
            return DropdownMenuItem<SlideType>(
              child: Text(item.name),
              value: item,
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
