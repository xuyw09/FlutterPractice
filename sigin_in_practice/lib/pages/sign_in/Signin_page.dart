import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();  ///获取formstate 可以对Form的子孙Formfield进行统一操作 有validate，save，reset等方法


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('登录界面', style: TextStyle(color: Colors.white)),
        //   iconTheme: IconThemeData(color: Colors.white),
        // ),
        body: Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 480,
            )),
          ),

          // Form Inputs
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '输入你的用户名',
                    icon: Icon(Icons.person)),
                validator: (value) => value.isEmpty ? '用户名不能为空' : null,
                // onSaved: (value) => _userName = value.trim(),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "输入登录密码", icon: Icon(Icons.lock)),
              obscureText: true,
              validator: (value) => value.isEmpty ? '密码不能为空' : null,
              // onSaved: (value) => _pwd = value.trim(),
            ),
          ),

          // Submit Button
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('登录',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                onPressed: () {
                  if ((_formKey.currentState as FormState).validate()) {
                    //通过验证 提交表格
                    print(_usernameController.text);
                    print(_pwdController.text);
                  }
                }),
          )
        ],
      ),
    ));
  }
}

