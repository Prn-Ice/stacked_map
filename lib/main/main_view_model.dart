import 'package:stacked/stacked.dart';

import '../core/app/locator.dart';
import '../core/services/bottom_nav_bar/bottom_nav_bar_service.dart';

/// ViewModel for the [MainView]
class MainViewModel extends BaseViewModel {
  final BottomNavBarService _bottomNavBarService =
      locator<BottomNavBarService>();

  /// Return the current value of the index, the index controls what screen
  /// is visible to the user.
  int get index => _bottomNavBarService.index;

  /// Change the current index, ie go to another screen.
  void changeTab(int index) {
    _bottomNavBarService.changeTab(index);
  }
}
