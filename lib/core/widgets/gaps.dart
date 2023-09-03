import 'package:flutter/material.dart';
import 'package:reviser/core/constant/dimension.dart';

Widget sliverDefaultVerticalGap = const SliverToBoxAdapter(
      child: SizedBox(height: Dimension.defaultVerticalGap),
    );

Widget sliverLargerVerticalGap = const SliverToBoxAdapter(
      child: SizedBox(height: Dimension.largerVerticalGap),
    );

Widget defaultVerticalGap = const SizedBox(height: Dimension.defaultVerticalGap);
Widget smallVerticalGap = const SizedBox(height: Dimension.smallVerticalGap);
