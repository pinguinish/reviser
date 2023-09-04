import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/strings.dart';
import 'package:reviser/core/utils/screen_util.dart';
import 'package:reviser/core/widgets/icon_text_button.dart';
import 'package:reviser/features/common/router/router.dart';

class DictionaryLookupButton extends StatelessWidget {
  const DictionaryLookupButton({super.key});

  @override
  Widget build(BuildContext context) {
    assert(context.deviceType is! LargeDeviceType);
    return context.adaptByDeviceType(
      small: (context) => IconTextButton(
        label: Strings.dictionary,
        icon: const Icon(Icons.book_rounded),
        onPressed: () => context.router.push(
          const VocabularyLookupRoute(),
        ),
      ),
      medium: (context) => FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => context.router.push(
          const VocabularyLookupRoute(),
        ),
        child: const Icon(Icons.book_outlined),
      ),
    );
  }
}
