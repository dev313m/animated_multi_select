import 'package:flutter/material.dart';
class SingleWidget extends StatefulWidget {
  final Color color;
  final List<String> selectionList;
  final double width;
  final double height;
  final String itemName;
  final Function onChangeFunction;
  final Widget insideWidget;
  final double borderWidth;
  final BorderRadius borderRadius;
  SingleWidget(
      {@required this.itemName,
        @required this.width,
        @required this.height,
        @required this.borderWidth,
        @required this.borderRadius,
        @required this.color,
        @required this.onChangeFunction,
        @required this.selectionList,
        @required this.insideWidget});
  @override
  _SingleWidget createState() => _SingleWidget();
}

class _SingleWidget extends State<SingleWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  int alpha;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    alpha = (_animation.value * 255).toInt();
    widget.selectionList.contains(widget.itemName)
        ? _controller.value = 255.0
        : _controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return GestureDetector(
            onTap: () {
              if (widget.selectionList.contains(widget.itemName))
                setState(() {
                  widget.selectionList.remove(widget.itemName);
                  _controller.reverse();
                  widget.onChangeFunction(
                      widget.selectionList..remove(widget.itemName));
                });
              else
                setState(() {
                  _controller.forward();
                  widget.onChangeFunction(
                      widget.selectionList..add(widget.itemName));
                });
            },
            child: Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    color: widget.color
                        .withAlpha((_controller.value * 255).toInt()),
                    border: Border.all(
                      color: widget.color
                          .withAlpha(255 - (_controller.value.toInt() * 255)),
                      width: 4.0,
                    )),
                child: widget.insideWidget));
      },
    );
  }
}
