import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.iconfig.dart';

/// Initialize an instance of the [Get] service locator
final GetIt locator = GetIt.instance;

@InjectableInit()

/// Function that initializes all services locatable by
/// [Get].
///
/// This executes an auto-generated function generated by
/// [Injectable]
void setupLocator() => $initGetIt(locator);
