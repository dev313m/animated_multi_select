#  Alrasasi Multi Selection Animated Widget

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


### Features

Get your horizantal smooth multi-select widget.

  - Change the color as you want
  - Change the size
  - Create you preffered customized multi list
  - Put it anywhere

![Image description](https://c.imge.to/2019/07/27/dJleR.png)


### Installation

You should ensure that you add the alrasasi_animated_multi_select as a dependency in your flutter project.

```yaml

dependencies:
  animated_multi_select: ^1.0
```
You should then run flutter packages get in your terminal so as to get the package.

### Usage
For production environments...

```dart
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: MultiSelectChip(
                    reverseScroll: false,
                    introWidget: CircleTransWidget(),
                    introWidgetWidth: 100,
                    color: Color(0xff293462),
                    width: 100,
                    height: 85,
                    borderRadius: BorderRadius.circular(15),
                    borderWidth: 3,
                    mainList: this.mainList,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedList = selectedList;
                      });
                    },
                    widgetList: widgetList,
                    initialSelectionList: selectedList,
                  )),
                ],
              ),
            ),
```

## Documentation

#### MultiSelectChip class

| Plugin | README |
| ------ | ------ |
| reverseScroll | from left to write of reverse |
| introWidget | The widget beside the multi list |
| introWidetWidth | the width of the introWidget is required, it is in stack |
| color | The color of the widget and its border |
| width | The width of the single selectio widget |
| height | The height of the single selected widget |
| borderRadius | the border radius of the single selected widget |
| onSelectionChanged | A function to react to selection actions |
| initialSelectionList | Initial list part from the main list|
| widgetList | the map that mutches the item with its created widget (see example in github) |


"# animated_multi_selection"
