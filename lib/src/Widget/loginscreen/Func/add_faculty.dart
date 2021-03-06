import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_schedule/src/Widget/bezierContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterFaculty extends StatefulWidget {

  @override
  _RegisterFacultyState createState() => new _RegisterFacultyState();
}



class _RegisterFacultyState extends State<RegisterFaculty>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _major = TextEditingController();
  final TextEditingController _fid = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;


  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'EXAM ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 60,
            fontWeight: FontWeight.w900,
            color: Colors.green,
          ),
          children: [
            TextSpan(
              text: 'SCHEDULING ',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            TextSpan(
              text: 'MANAGEMENT SYSTEM',
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _reg() {
    return InkWell(
      onTap: (){
        if (_formKey.currentState.validate()) {
          _register();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xFF26667d).withAlpha(200),
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.yellowAccent, Colors.red])),
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),),

    );

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: _formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("First Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _fname,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Last Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _lname,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Major",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _major,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("F_ID",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _fid,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _emailController,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        _reg(),
        SizedBox(height: 40),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Faculty Registration"),
        actions: <Widget>[
        ],
        backgroundColor: Color(0xFF26667d),
      ),
      body: new Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF143642), Color(0xFF26667d)],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery
                    .of(context)
                    .size
                    .width * .4,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      _title(),
                      SizedBox(height: 30),
                      loginForm,
                    ],
                  )
              ),
            ),],
        ),
      ),
    );
  }



  void _register(){
    if (_emailController.text != null) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _fid.text+'@cb.faculties.amrita.edu',
        password: _passwordController.text,
      ).then((result) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Report"),
                content: Text("\""+ _fid.text+'@cb.faculties.amrita.edu' +"\"" +" is successfully registered."),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      clearText();
                      _data();
                    },
                  )
                ],
              );
            }
        );
      })
          .catchError((err) {
        print(err.message);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(err.message),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    }
  }



  void _data() {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Faculty").doc(_fid.text).set(
        {
          "Fname" : _fname.text,
          "Lname" : _lname.text,
          "Major" : _major.text,
          "F_ID" : _fid.text,
          "Email" : _emailController.text,
          "Password" : _passwordController.text,
          "Dept_ID" : "19CSE",
        }).then((_){
      print(firebaseUser);
    });
  }

  void clearText() {
    _fname.clear();
    _lname.clear();
    _major.clear();
    _fid.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


}
