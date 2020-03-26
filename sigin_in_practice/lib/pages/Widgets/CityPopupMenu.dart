import 'package:flutter/material.dart';
import 'package:sigin_in_practice/index.dart';
import 'package:sigin_in_practice/states/curCity_change_notifier.dart';

class CityPopupMenu extends StatefulWidget {
  final curCityChanged;
  const CityPopupMenu({Key key, this.curCityChanged}) : super(key: key);
  @override
  _CityPopupMenuState createState() => _CityPopupMenuState();
}

class _CityPopupMenuState extends State<CityPopupMenu> {
  @override
  Widget build(BuildContext context) {
    CityModel cityModel = Provider.of<CityModel>(context);
    final List<City> cityList = cityModel.cityList.toList();
    final City city = cityModel.city ?? cityList[0];
    return PopupMenuButton(
      icon: Icon(Icons.location_on),
      onSelected: (String value) {
        setState(() {
          widget.curCityChanged(value);
          //TODO 通知全局curCity更改，获取该城市的项目列表
        });
      },
      itemBuilder: (BuildContext context) {
        return cityList
            .map((c) => PopupMenuItem(
                  child: Text(c.name),
                  value: c.name,
                ))
            .toList();
      },
    );
  }
}
