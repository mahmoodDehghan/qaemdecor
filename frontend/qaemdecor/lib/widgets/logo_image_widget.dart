import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qaemdecor/models/LogoImage.dart';
import 'package:qaemdecor/providers/logo_link_provider.dart';

class LogoImageWidget extends HookConsumerWidget {
  const LogoImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue logo = ref.watch(logoLinkProvider);
    return logo.when(
      data: (data) {
        LogoImage logo = data;
        return Container(
          width: double.infinity,
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 150,
              height: 150,
              child: FittedBox(
                alignment: Alignment.topRight,
                fit: BoxFit.cover,
                child: Image.network('http://localhost:8000' + logo.imageFile),
              ),
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
