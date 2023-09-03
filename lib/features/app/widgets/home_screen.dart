import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/utils/screen_util.dart';
import 'package:reviser/features/search/widgets/search.dart';

@RoutePage(name: "InitialRoute")
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => context.adaptByDeviceType(
        small: (context) => const _SmallHomeView(),
        medium: (context) => const _MediumHomeView(),
        large: (context) => const _LargeHomeView(),
      );
}

//
///==========[_SmallHomeView]==========
//
class _SmallHomeView extends StatelessWidget {
  const _SmallHomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Search(),
              ),
            ),
            if (context.deviceType is LargeDeviceType) ...[
              // [TODO]: Implement the search feature for large device typies
            ]
          ],
        ),
      ),
    );
  }
}

//
///==========[_MediumHomeView]==========
//
class _MediumHomeView extends StatelessWidget {
  const _MediumHomeView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Search(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
///==========[_LargeHomeView]==========
//
class _LargeHomeView extends StatelessWidget {
  const _LargeHomeView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 600),
              sliver: SliverToBoxAdapter(
                child: Search(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
