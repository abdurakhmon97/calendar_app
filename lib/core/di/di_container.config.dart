// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:calendar_app/data/repositories/events_repository_impl.dart'
    as _i6;
import 'package:calendar_app/data/storage/db_helper.dart' as _i3;
import 'package:calendar_app/data/storage/storage_module.dart' as _i4;
import 'package:calendar_app/domain/repositories/events_repository.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dBModule = _$DBModule();
    gh.singletonAsync<_i3.DatabaseHelper>(
      () => dBModule.createDb(),
      dispose: _i4.disposeDb,
    );
    gh.singletonAsync<_i5.EventsRepository>(() async =>
        _i6.EventsRepositoryImpl(await getAsync<_i3.DatabaseHelper>()));
    return this;
  }
}

class _$DBModule extends _i4.DBModule {}
