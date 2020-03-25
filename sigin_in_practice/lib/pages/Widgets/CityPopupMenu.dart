import 'package:flutter/material.dart';
import 'package:sigin_in_practice/index.dart';

class CityPopupMenu extends StatefulWidget {
  final curCityChanged;
  const CityPopupMenu({Key key, this.curCityChanged}) : super(key: key);
  @override
  _CityPopupMenuState createState() => _CityPopupMenuState();
}

class _CityPopupMenuState extends State<CityPopupMenu> {
  final List<String> cities = ['上海', '南京'];
  Widget dropdownWidget() {
    return PopupMenuButton(
      icon: Icon(Icons.location_on),
      onSelected: (String value) {
        setState(() {
          widget.curCityChanged(value);
        });
      },
      itemBuilder: (BuildContext context) {
        return cities
            .map((c) => PopupMenuItem(
                  child: Text(c),
                  value: c,
                ))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return dropdownWidget();
  }
}
