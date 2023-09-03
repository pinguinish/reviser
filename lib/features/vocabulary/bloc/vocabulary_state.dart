import 'package:equatable/equatable.dart';

sealed class VocabularyState extends Equatable {}

final class VocabularyIdle extends VocabularyState {
  @override
  List<Object> get props => [];
}

final class VocabularyProccessing extends VocabularyState {
  @override
  List<Object> get props => [];
}
