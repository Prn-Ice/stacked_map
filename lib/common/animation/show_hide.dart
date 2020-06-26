import 'package:flutter/widgets.dart';

/// A widget that will animate in by growing to its full size
/// and shrinking away depending on `showing`.
/// - Usually `showing` is stored in the view model to show or hide a widget.
///
/// Example:
/// {@tool snippet}
/// ```dart
/// ShowHide(
///     showing: model.showHiddenWidget,
///     child: HiddenWidget(),
/// ),
/// ```
/// {@end-tool}
class ShowHide extends StatefulWidget {
  // ignore: public_member_api_docs
  const ShowHide({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 200),
    @required this.showing,
  })  : assert(child != null),
        super(key: key);

  /// The [Widget] on which the animation is applied.
  final Widget child;

  /// How long it takes to show/hide
  final Duration duration;

  /// Whether the [Widget] is visible.
  final bool showing;

  @override
  _ShowHideState createState() => _ShowHideState();
}

class _ShowHideState extends State<ShowHide>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showing) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    return SizeTransition(
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
