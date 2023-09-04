

import 'package:drift/drift.dart';

Value<T> getValueOrAbsent<T>(T? t) =>
    t != null ? Value(t) : const Value.absent();