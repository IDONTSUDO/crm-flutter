import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  final String textOff;

  final String textOn;
  final double width;
  const CustomSwitch(
      {Key key,
      this.value,
      this.onChanged,
      this.activeColor,
      this.textOn,
      this.textOff,
      this.width})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width,
            height: 30.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? Colors.grey
                    : widget.activeColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 3.0, bottom: 3.0, right: 3.0, left: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _circleAnimation.value == Alignment.topRight
                      ? Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Text(
                            widget.textOn,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Container(),
                  Align(
                    alignment: _circleAnimation.value,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  _circleAnimation.value == Alignment.centerLeft
                      ? Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            widget.textOff,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
