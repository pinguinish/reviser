import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/utils/screen_util.dart';

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
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Text("Hello, World"),
              ),
            ),
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
                child: Text("Hello, World"),
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
    //  Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.6,
    //             child: const Text("Hello, World"),
    //           ),
    //           const SizedBox(height: 10),
    //           const Text(
    //             "Your assistant for improving English vocabulary - find, learn, memorize and revise",
    //             style: TextStyle(color: Palette.grey, fontSize: 12),
    //           ),
    //           const SizedBox(height: 20),
    //         ],
    //       )
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Text("Hello, World"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}