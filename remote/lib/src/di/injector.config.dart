// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_service.dart' as _i9;
import '../api/auth_service.dart' as _i6;
import '../api/endpoint_provider.dart' as _i5;
import '../auth_remote_repository_impl.dart' as _i8;
import '../mapper/articles_entity_mapper.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initRemoteGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final apiService = _$ApiService();
  gh.factory<_i3.ArticlesEntityMapper>(() => _i3.ArticlesEntityMapper());
  gh.singleton<_i4.Dio>(apiService.init());
  gh.singleton<_i5.EndpointProvider>(_i5.EndpointProvider(get<_i4.Dio>()));
  gh.singleton<_i6.AuthService>(_i6.AuthService(get<_i5.EndpointProvider>()));
  gh.factory<_i7.AuthRemoteRepository>(() => _i8.AuthRepositoryImpl(
        authService: get<_i6.AuthService>(),
        authEntityMapper: get<_i3.ArticlesEntityMapper>(),
      ));
  return get;
}

class _$ApiService extends _i9.ApiService {}
