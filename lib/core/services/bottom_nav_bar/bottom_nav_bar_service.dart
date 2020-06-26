/// Service responsible for handling and reporting the state of the
/// [BottomNavBar].
abstract class BottomNavBarService {
  /// Return the current value of the index, the index controls what screen
  /// is visible to the user.
  int get index;

  /// Change the current index, ie go to another screen.
  void changeTab(int index) {}
}
