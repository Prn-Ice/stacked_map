import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_map/common/animation/fade_in.dart';
import 'package:stacked_map/common/lazy_index_stack.dart';
import 'package:stacked_map/common/styling/app_colors.dart';
import 'package:stacked_map/map/map_view.dart';
import 'package:stacked_map/mock1/mock1_view.dart';
import 'package:stacked_map/mock2/mock2_view.dart';

import 'common/bottom_nav_bar.dart';
import 'main_view_model.dart';

/// This view contains the [BottomNavBar] as well as the views controlled
/// by the [BottomNavBar].
/// It uses a [LazyIndexedStack] to display the selected child
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  AnimationController _hide;

  final List<Widget> _views = <Widget>[
    FadeIn(child: MapView()),
    FadeIn(child: Mock1View()),
    FadeIn(child: Mock2View()),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (_, model, child) {
        ResponsiveWidgets.init(
          context,
          height: 812.0,
          width: 375.0,
          allowFontScaling: false,
        );

        return ResponsiveWidgets.builder(
          height: 812.0,
          width: 375.0,
          allowFontScaling: false,
          child: Scaffold(
            backgroundColor: governorBay,
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: Obx(
                  () => NotificationListener<ScrollNotification>(
                    onNotification: _handleScrollNotification,
                    child: LazyIndexedStack(
                      reuse: false,
                      index: model.index,
                      itemCount: _views.length,
                      itemBuilder: (_, index) => _views[index],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(
              sizeFactor: _hide,
            ),
          ),
        );
      },
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
