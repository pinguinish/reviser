// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:reviser/features/search/data/models/word/word_model.dart';
// import 'package:reviser/features/search/data/source/remote/search_remote_data_source.dart';

// import 'models/test_response.dart';

// class DioAdapterMock extends Mock implements Dio {}

// void main() {
//   group('search', () {
//     final client = DioAdapterMock();

//     test("Whether search", () async {
//       final search = SearchRemoteDataSource(client);

//       when(client.get(SearchRemoteDataSource.kFreeDictionaryApiEndpoint +
//               TestResponse.mobile))
//           .thenAnswer(
//         (_) async => Response(
//           data: jsonEncode(TestResponse.mobile),
//         ),
//       );

//       expect(await search.search("mobile"), isA<List<WordModel>>());
//     });
//   });
// }
