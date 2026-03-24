import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/authors_app_shared/lib/src/core/device/device_dependencies.dart';
import 'package:authors/data/data_dependencies.dart';
import 'package:authors/domain/domain_dependencies.dart';
import 'package:authors/presentation/presentation_dependencies.dart';

Future<void> registerAppDependencies({required DI di}) async {
  final dependenciesList = <PackageDependencies>[
    CoreDependencies(),
    DeviceDependencies(),
    DataDependencies(),
    DomainDependencies(),
    PresentationDependencies(),
  ];

  for (final dependencies in dependenciesList) {
    await dependencies.register(di);
  }
}
