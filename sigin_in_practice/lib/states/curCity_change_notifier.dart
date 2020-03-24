import 'package:sigin_in_practice/index.dart';
import '../models/city.dart';

class CurCityChangeNotifier extends ChangeNotifier {
  City get _curCity => Global.curCity;

  @override
  void notifyListeners() {
    print('curCity notifyListeners');
    Global.saveCurCity(_curCity);
    super.notifyListeners();
  }
}

class CityModel extends CurCityChangeNotifier {
  City get city => _curCity;

//更新curCity
  set city(City _city) {
    if (_city.id != city.id) {
      city = _city;
      notifyListeners();
    }
  }
}
