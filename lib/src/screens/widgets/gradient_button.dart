import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required Widget child,
    @required Gradient gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  })  : assert(child != null),
        assert(gradient != null),
        _child = child,
        _gradient = gradient,
        super(key: key);

  final Widget _child;
  final Gradient _gradient;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(6.0);

    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: _gradient,
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[500],
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: _child,
            )),
      ),
    );
  }
}
