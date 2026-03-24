import 'package:authors/authors_app_shared/lib/src/core.dart';
import 'package:authors/authors_app_shared/lib/src/core/device/device_app_key_value_storage.dart';

class DeviceDependencies extends PackageDependencies {
  @override
  Future<void> register(DI di) async {
    final appKeyValueStorage = await DeviceAppKeyValueStorage.create(
      jsonStringConverter: di(),
    );

    di.registerSingleton<AppKeyValueStorage>(appKeyValueStorage);
  }
}
