import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/models/user.dart';

class EditAccount extends StatefulWidget {
  EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, "/Account"),
          ),
          title: Text("Edit Account"),
          backgroundColor: Colors.black,
        ),
        body: Padding(padding: const EdgeInsets.all(20), child: PageForm()));
  }
}

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  var user = new MyUser();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.text = user.email;
    _nameController.text = user.name;
    _phoneController.text = user.phone;
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    super.dispose();
    _phoneFocus.dispose();
    super.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void ButtonValidate() {
    if (_formKey.currentState!.validate()) {
      print('${user.name}:${user.phone}:${user.email}');

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Submitted successfully :)')));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Problem submitting form :(')));
      setState(() {
        _autovalidate = true;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  var _autovalidate = false;
  bool color = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    const _defaultColor = Colors.grey;
    const _focusColor = Colors.black;
    return SingleChildScrollView(
      child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
              onDoubleTap: () {
                setState(() {
                  isTapped = false;
                });
              },
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: (isTapped) ? Colors.grey[700] : Colors.grey[400],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
                focusNode: _nameFocus,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.person_fill,
                    size: 30,
                    color: _nameFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: _nameFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  user.name = value;
                  setState(() {
                    color = true;
                  });
                },
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(_nameFocus);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Name';
                  }
                  if (!(value.length > 5)) {
                    return "Enter valid name of more than 5 characters!";
                  }
                  return null;
                }),
            SizedBox(height: 20),
            TextFormField(
                controller: _phoneController,
                focusNode: _phoneFocus,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.phone_fill,
                    size: 20,
                    color: _phoneFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: _phoneFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  user.phone = value;
                  setState(() {
                    color = true;
                  });
                },
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(_phoneFocus);
                  });
                },
                validator: (value) {
                  String patttern = r'(^[0-9]{10}$)';

                  RegExp regExp = new RegExp(patttern);
                  if (value!.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  if (value.length != 10)
                    return 'Mobile Number must be of 10 digit';
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                }),
            SizedBox(height: 20),
            TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.mail_solid,
                    size: 20,
                    color: _emailFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Email Address',
                  labelStyle: TextStyle(
                    color: _emailFocus.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  user.email = value;
                  setState(() {
                    color = true;
                  });
                },
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  });
                },
                validator: (value) {
                  String patttern = r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$';
                  RegExp regExp = new RegExp(patttern);
                  if (value!.isEmpty) {
                    return 'Please enter your Email Address';
                  }
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter valid Email Address';
                  }
                  return null;
                }),
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    color: (color) ? Colors.black : Colors.grey,
                    child: Text('Update Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () => color ? ButtonValidate() : null))
          ])),
    );
  }
}
