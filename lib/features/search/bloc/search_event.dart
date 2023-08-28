import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchStarted extends SearchEvent {
  const SearchStarted({required this.word});

  final String word;
  
  @override
  List<Object> get props => [word];

  @override
  bool get stringify => true;
}
