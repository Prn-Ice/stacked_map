import 'package:flutter/widgets.dart';

/// Values for fade direction.
enum FadeInDirection {
  /// Fade from the left.
  left,

  /// Fade from the right.
  right,

  /// Fade from the bottom.
  bottom,

  /// Fade from the top.
  top,
}

/// A widget to fade in and translate its child widget when inserted into the
/// widget tree
///
/// Example:
/// {@tool snippet}
/// ```dart
/// FadeInTranslate(
///     direction: FadeInDirection.right,
///     child: SomeWidget(),
///   ),
/// ),
/// ```
/// {@end-tool}
class FadeInTranslate extends StatefulWidget {
  // ignore: public_member_api_docs
  const FadeInTranslate({
    Key key,
    @required this.child,
    this.direction = FadeInDirection.left,
    this.duration = const Duration(milliseconds: 500),
  })  : assert(child != null),
        super(key: key);

  /// The [Widget] on which the fade is applied.
  final Widget child;

  /// Direction where the translate starts.
  final FadeInDirection direction;

  /// Duration of the animation.
  final Duration duration;

  @override
  _FadeInTranslateState createState() => _FadeInTranslateState();
}

class _FadeInTranslateState extends State<FadeInTranslate>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacityAnimation;
  Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _translateAnimation = _getOffsetTween().animate(_controller);
    _controller.drive(
      CurveTween(curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _translateAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  Tween<Offset> _getOffsetTween() {
    switch (widget.direction) {
      case FadeInDirection.left:
        return Tween<Offset>(begin: const Offset(-130, 0), end: Offset.zero);
      case FadeInDirection.right:
        return Tween<Offset>(begin: const Offset(130, 0), end: Offset.zero);
      case FadeInDirection.top:
        return Tween<Offset>(begin: const Offset(0, -130), end: Offset.zero);
      default:
        return Tween<Offset>(begin: const Offset(0, 130), end: Offset.zero);
    }
  }
}
