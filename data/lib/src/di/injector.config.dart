// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth_repository_impl.dart' as _i10;
import '../mapper/articles/user_mapper.dart' as _i3;
import '../repository/auth_remote_repository.dart' as _i7;
import '../repository/cache_storage_repository.dart' as _i5;
import '../source/cache_data_source.dart' as _i4;
import '../source/data_source_factory.dart' as _i8;
import '../source/remote_data_source.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.UserMapper>(() => _i3.UserMapper());
  gh.singleton<_i4.CacheDataSource>(
      _i4.CacheDataSource(get<_i5.CacheStorageRepository>()));
  gh.singleton<_i6.RemoteDataSource>(_i6.RemoteDataSource(
      authRemoteRepository: get<_i7.AuthRemoteRepository>()));
  gh.singleton<_i8.DataSourceFactory>(_i8.DataSourceFactory(
    remoteDataSource: get<_i6.RemoteDataSource>(),
    localDataSource: get<_i4.CacheDataSource>(),
  ));
  gh.factory<_i9.AuthRepository>(() => _i10.ArticlesRepositoryImpl(
        dataSourceFactory: get<_i8.DataSourceFactory>(),
        userMapper: get<_i3.UserMapper>(),
      ));
  return get;
}
