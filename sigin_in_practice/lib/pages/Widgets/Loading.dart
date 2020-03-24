import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final String text;
  // final Widget child;
  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 128,
            height: 128,
            child: Container(
              decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          // child: child,
        ));
  }
}

class Loading {
  static bool _loading = false;

  static void showDialog(BuildContext context, String text) {
    if (!_loading) {
      _loading = true;
      Navigator.push(
          context,
          _PopRoute(
              child: LoadingDialog(
            text: text,
          )));
    }
  }

  static void hideDialog(BuildContext context) {
    if (_loading) {
      Navigator.of(context).pop();
      _loading = false;
    }
  }
}

// handle Route
class _PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 400);
  Widget child;

  _PopRoute({@required this.child});
  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
