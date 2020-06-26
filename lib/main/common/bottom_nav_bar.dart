import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:stacked/stacked.dart';

import '../../common/helper_widgets/ui_helpers.dart';
import '../../common/styling/app_colors.dart';
import '../main_view_model.dart';

/// The Navigation Bar widget used in our [MainView]
class BottomNavBar extends ViewModelWidget<MainViewModel> {
  /// Create a simple [BottomNavigationBar] with custom height
  /// and [BottomNavigationBarItem]
  const BottomNavBar({
    Key key,
    @required this.sizeFactor,
  })  : assert(sizeFactor != null),
        super(key: key);

  /// [sizeFactor] for the [SizeTransition].
  final Animation<double> sizeFactor;

  @override
  Widget build(BuildContext context, MainViewModel model) {
    return SizeTransition(
      sizeFactor: sizeFactor,
      axisAlignment: -1.0,
      child: SizedBox(
        height: responsiveHeight(67.0),
        child: Obx(
          () => BottomNavigationBar(
            currentIndex: model.index,
            onTap: (index) {
              model.changeTab(index);
            },
            backgroundColor: Colors.white,
            elevation: 0,
            selectedIconTheme: IconThemeData(
              color: governorBay,
              size: responsiveWidth(28.0),
            ),
            unselectedIconTheme: IconThemeData(
              color: chetwodeBlue,
              size: responsiveWidth(25.0),
            ),
            showUnselectedLabels: true,
            selectedItemColor: governorBay,
            unselectedItemColor: chetwodeBlue,
            items: <BottomNavigationBarItem>[
              _buildBottomNavigationBarItem(
                  MaterialCommunityIcons.view_grid, 'Home'),
              _buildBottomNavigationBarItem(
                  MaterialCommunityIcons.map_marker_radius, 'Places'),
              _buildBottomNavigationBarItem(
                  MaterialCommunityIcons.chat, 'Chat'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    IconData iconData,
    String title,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsetsResponsive.only(bottom: 5.0),
        child: Icon(
          iconData,
          size: responsiveWidth(18.7),
        ),
      ),
      title: Text(title),
    );
  }
}
