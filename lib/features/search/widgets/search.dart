import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/core/utils/mixins/validator_mixin.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
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
                hintText: "Search",
              ),
            ),
          ),
          const SizedBox(width: 10),
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
      onSearch: _moveToResultPage,
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
