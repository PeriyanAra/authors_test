import 'package:authors/authors_app_shared/lib/src/core/client/custom_serialize.dart';
import 'package:chopper/chopper.dart';

abstract class Client {
  static ChopperClient createStagingClient({
    String baseUrl = 'https://openlibrary.org',
  }) {
    return ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      converter: JsonSerializableConverter.instance,
    );
  }
}
