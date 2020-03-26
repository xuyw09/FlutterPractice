import 'package:flutter/material.dart';
import 'package:sigin_in_practice/common/http/HttpUtils.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('this is projectList'),
      RaisedButton(
        child: Text('projectList'),
        onPressed: () {
          var r = HttpUtils.getProjectList('上海');
          print(r);
        },
      )
    ]);
  }
}
