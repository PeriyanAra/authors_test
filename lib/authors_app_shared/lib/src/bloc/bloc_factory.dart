import 'package:authors/authors_app_shared/lib/src/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFactory {
  BlocFactory({required DI di}) : _di = di;

  final DI _di;

  T get<T extends BlocBase<Object>>() => _di.get<T>();

  T getWithParam<T extends BlocBase<Object>, P>(P param) =>
      _di.getWithParam<T, P>(param);
}
