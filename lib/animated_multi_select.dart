library animated_multi_select;
import 'package:animated_multi_select/single_widget.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> mainList;
  final Color color;
  final Function(List<String>) onSelectionChanged;
  final List<String> initialSelectionList;
  final double width;
  final double height;
  final Map<String, Widget> widgetList;
  final double borderWidth;
  final bool reverseScroll;
  final Widget introWidget;
  final BorderRadius borderRadius;
  final double introWidgetWidth;
  MultiSelectChip(
      {@required this.mainList,
      this.introWidgetWidth,
      @required this.reverseScroll,
      this.introWidget,
      @required this.borderRadius,
      @required this.borderWidth,
      @required this.widgetList,
      @required this.onSelectionChanged,
      @required this.initialSelectionList,
      @required this.width,
      @required this.height,
      @required this.color});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.mainList.forEach((item) {
      choices.add(Container(
          padding: EdgeInsets.all(1),
          child: SingleWidget(
              onChangeFunction: widget.onSelectionChanged,
              itemName: item,
              width: widget.width,
              height: widget.height,
              selectionList: selectedChoices,
              color: widget.color,
              borderRadius: widget.borderRadius,
              borderWidth: widget.borderWidth,
              insideWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[widget.widgetList[item]],
              ))));
    });
    return choices;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedChoices = widget.initialSelectionList;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.introWidget == null)
      return Container(
        height: widget.height,
        child: ListView(
          reverse: widget.reverseScroll,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              children: _buildChoiceList(),
            ),
          ],
        ),
      );
    return Container(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          ListView(
            reverse: widget.reverseScroll,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                width: widget.introWidgetWidth,
              ),
              Row(
                children: _buildChoiceList(),
              ),
            ],
          ),
          Align(
              alignment: widget.reverseScroll
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: widget.introWidget)
        ],
      ),
    );
  }
}