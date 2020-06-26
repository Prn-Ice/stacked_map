import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:stacked_map/common/styling/app_colors.dart';

/// The height of the status bar area
final double statusBarHeight = Get.mediaQuery.padding.top;

/// Responsive border radius of 5 on all sides.
const BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5.0));

/// Responsive padding of 16.0 Left and Right.
final EdgeInsets paddingLR16 = EdgeInsetsResponsive.symmetric(horizontal: 16.0);

/// A grey outline input border with [borderRadius5]
const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: borderRadius5,
  borderSide: BorderSide(
    color: mercuryDarker,
  ),
);

/// Return a responsive height.
double responsiveHeight(double height) {
  return ScreenUtil().setHeight(height).toDouble();
}

/// Return a responsive width.
double responsiveWidth(double width) {
  return ScreenUtil().setWidth(width).toDouble();
}

/// Return a [SizedBox] width responsive height.
Widget verticalSpace(double height) {
  return SizedBox(height: ScreenUtil().setHeight(height).toDouble());
}

/// Return a [SizedBox] width responsive width.
Widget horizontalSpace(double width) {
  return SizedBox(width: ScreenUtil().setWidth(width).toDouble());
}

/// A [VerticalDivider] that works.
class MyVerticalDivider extends StatelessWidget {
  /// Draws a vertical line, useful for separating widgets.
  const MyVerticalDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: responsiveHeight(50.0),
      decoration: BoxDecoration(
        color: mercury,
      ),
    );
  }
}

/// A [HorizontalDivider] that works.
class MyHorizontalDivider extends StatelessWidget {
  /// Draws a horizontal line, useful for separating widgets.
  const MyHorizontalDivider({
    Key key,
    this.height = 2,
    this.color = mercury,
  }) : super(key: key);

  /// The height of this divider.
  final double height;

  /// The color of this divider.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
