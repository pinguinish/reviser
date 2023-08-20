import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
  filter: kReleaseMode ? ProductionFilter() : DevelopmentFilter(),
);
