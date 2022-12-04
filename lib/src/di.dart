import 'package:cache/cache.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';
import 'package:remote/remote.dart';
import 'package:domain/domain.dart';
import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies() async {
  await configureCacheDependencies(di);
  await configureDomainDependencies(di);
  await configureDataDependencies(di);
  await configureRemoteDependencies(di);
  $initGetIt(di);
}
