// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:stacked_map/core/services/bottom_nav_bar/bottom_nav_bar_service_impl.dart';
import 'package:stacked_map/core/services/bottom_nav_bar/bottom_nav_bar_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<BottomNavBarService>(() => BottomNavBarServiceImpl());
}
