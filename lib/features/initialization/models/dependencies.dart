import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/router/router.dart';
import 'package:reviser/features/initialization/widgets/dependencies_scope.dart';
import 'package:reviser/features/search/data/repository/search_repository.dart';
import 'package:reviser/features/search/data/source/remote/i_search_remote_data_source.dart';
import 'package:reviser/features/search/data/source/remote/search_remote_data_source.dart';
import 'package:reviser/features/search/domain/repository/i_search_repository.dart';

abstract class Dependencies {
  const Dependencies();

  static Dependencies of(BuildContext context) =>
      DependenciesScope.of(context, listen: false);

  abstract final AppRouter router;

  abstract final Dio httpClient;

  abstract final ISearchRemoteDataSource searchRemoteDataSource;
  abstract final ISearchRepository searchRepository;
}

final class MutableDependencies extends Dependencies {
  MutableDependencies();

  @override
  late final Dio httpClient = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 15),
  ));

  @override
  late final ISearchRemoteDataSource searchRemoteDataSource =
      SearchRemoteDataSource(httpClient);

  @override
  late final ISearchRepository searchRepository =
      SearchRepository(searchRemoteDataSource: searchRemoteDataSource);

  @override
  late final AppRouter router = AppRouter();
}
