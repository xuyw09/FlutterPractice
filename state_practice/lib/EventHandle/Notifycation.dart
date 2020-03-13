import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + " ";
          });
          return false;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // RaisedButton(
              //     onPressed: () => MyNotification("Hi").dispatch(context), 这里用的context是根context，而NotificationListener监听的是子树
              //     child: Text("Send Notification")),  
              Builder(
                builder: (context) {
                  return RaisedButton(
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"));
                },
              ),
              Text(_msg)
            ],
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
