import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/dimension.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/bloc/constant/strings.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/core/utils/logger.dart';
import 'package:reviser/core/utils/mixins/validator_mixin.dart';
import 'package:reviser/core/utils/screen_util.dart';
import 'package:reviser/features/initialization/models/dependencies.dart';
import 'package:reviser/features/search/widgets/search_scope.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
    this.previous = "",
  });

  final String previous;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with ValidatorMixin {
  late final _searchTextController = TextEditingController(
    text: widget.previous,
  );

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.searchPaddingHV.$1,
        vertical: Dimension.searchPaddingHV.$2,
      ),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(Dimension.defaultRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: TextField(
              inputFormatters: onlyText,
              controller: _searchTextController,
              onSubmitted: _search,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: Strings.search,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              color: Palette.white,
              style: IconButton.styleFrom(
                backgroundColor: Palette.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _search(_searchTextController.text),
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _search(String value) {
    if (isEmpty(value)) return;
    return SearchScope.search(
      context: context,
      match: value,
      onSearch: (match) {
        context.performActionByDeviceType(
          small: () => _moveToResultPage(match),
          medium: () => _moveToResultPage(match),

          /// [TODO]: Implement the search feature for large device typies
          large: () => logger.e(
            """The search feature hasn't been"""
            """implemented for large device typies""",
          ),
        );
      },
    );
  }

  void _moveToResultPage(String match) {
    if (!Navigator.canPop(context)) {
      Dependencies.of(context).router.push(
            RepositoryRoute(
              search: _searchTextController.text,
            ),
          );
      _searchTextController.clear();
    }
  }
}
