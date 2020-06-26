import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'bottom_nav_bar_service.dart';

@LazySingleton(as: BottomNavBarService)

/// Implementation of [BottomNavBarService].
class BottomNavBarServiceImpl implements BottomNavBarService {
  final IntX<int> _index = 0.obs;

  @override
  void changeTab(int newIndex) {
    _index.value = newIndex;
  }

  @override
  int get index => _index.value;
}
