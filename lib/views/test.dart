import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.text = '2019nidhi.thakkar@ves.ac.in';
    _nameController.text = 'Nidhi Thakkar';
    _phoneController.text = '+91 9769326454';
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  var _autovalidate = false;
  var _name;
  var _phone;
  var _email;
  bool colorButton = false;

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    const _defaultColor = Colors.grey;
    const _focusColor = Colors.black;
    return SingleChildScrollView(
      child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20),
            TextFormField(
                focusNode: _focusNode,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.person_fill,
                    size: 20,
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  _name = value;
                  setState(() {
                    colorButton = true;
                  });
                },
                onTap: _requestFocus,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                }),
            SizedBox(height: 20),
            TextFormField(
                controller: _phoneController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.phone_fill,
                    size: 20,
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  _phone = value;
                  setState(() {
                    colorButton = true;
                  });
                },
                onTap: _requestFocus,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  return null;
                }),
            SizedBox(height: 20),
            TextFormField(
                controller: _emailController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.mail_solid,
                    size: 20,
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Email Address',
                  labelStyle: TextStyle(
                    color: _focusNode.hasFocus ? _focusColor : _defaultColor,
                  ),
                ),
                onChanged: (value) {
                  _email = value;
                  setState(() {
                    colorButton = true;
                  });
                },
                onTap: _requestFocus,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email Address';
                  }
                  return null;
                }),
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: FlatButton(
                    color: (colorButton) ? Colors.black : Colors.grey,
                    child: Text('Update Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('$_name:$_phone:$_email');

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
                    }))
          ])),
    );
  }
}
