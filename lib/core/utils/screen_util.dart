import 'package:flutter/material.dart';

abstract class ScreenDimension {
  static const (double min, double max) small = (0, 640);
  static const (double min, double max) medium = (640, 1024);
  static const (double min, double max) large = (1024, double.infinity);
}

abstract class DeviceTextScaleFactor {
  static const double small = 1;
  static const double medium = 1.4;
  static const double large = 1;
}

Widget callDeviceBuilderCheckingNull(
  WidgetBuilder? builder,
  BuildContext context,
) =>
    builder == null ? const SizedBox.shrink() : builder(context);

extension ScreenUtilExtension on BuildContext {
  Widget adaptByDeviceType({
    WidgetBuilder? large,
    WidgetBuilder? medium,
    WidgetBuilder? small,
  }) =>
      switch (ScreenUtil.deviceTypeOf(View.of(this).display.size)) {
        LargeDeviceType _ => callDeviceBuilderCheckingNull(large, this),
        MediumDeviceType _ => callDeviceBuilderCheckingNull(medium, this),
        SmallDeviceType _ => callDeviceBuilderCheckingNull(small, this),
      };
}

class DeviceTypeException implements Exception {
  final String message;
  const DeviceTypeException(this.message);

  @override
  String toString() => message;
}

class ScreenUtil {
  static DeviceType deviceTypeOf(Size size) => switch (size) {
        (Size size) when size.width < DeviceType.small.size.$2 =>
          DeviceType.small,
        (Size size) when size.width < DeviceType.medium.size.$2 =>
          DeviceType.medium,
        (Size size) when size.width < DeviceType.large.size.$2 =>
          DeviceType.large,
        _ =>
          throw DeviceTypeException("Undefined device type with Size($size)"),
      };

}

@immutable
sealed class DeviceType {
  final String representation;
  final (double, double) size;

  final double textScaleFactor;

  static DeviceType large = const LargeDeviceType();
  static DeviceType medium = const MediumDeviceType();
  static DeviceType small = const SmallDeviceType();

  const DeviceType({
    required this.representation,
    required this.size,
    this.textScaleFactor = 1,
  });

  @override
  String toString() => representation;
}

final class LargeDeviceType extends DeviceType {
  const LargeDeviceType()
      : super(
          representation: "Large",
          size: ScreenDimension.large,
          textScaleFactor: DeviceTextScaleFactor.large,
        );
}

final class MediumDeviceType extends DeviceType {
  const MediumDeviceType()
      : super(
          representation: "Medium",
          size: ScreenDimension.medium,
          textScaleFactor: DeviceTextScaleFactor.medium,
        );
}

final class SmallDeviceType extends DeviceType {
  const SmallDeviceType()
      : super(
            representation: "Small",
            size: ScreenDimension.small,
            textScaleFactor: DeviceTextScaleFactor.small);
}
