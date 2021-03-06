import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_schedule/src/Widget/bezierContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterExam extends StatefulWidget {

  @override
  _RegisterExamState createState() => new _RegisterExamState();
}



class _RegisterExamState extends State<RegisterExam>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  final TextEditingController _eid = TextEditingController();
  final TextEditingController _cid = TextEditingController();
  final TextEditingController _time = TextEditingController();
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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Report"),
                  content: Text("\""+ _eid.text +"\"" +" is successfully registered."),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _data();
                        clearText();
                      },
                    )
                  ],
                );
              }
          );
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
                colors: [Colors.deepOrange, Colors.green])),
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
              Text("Exam ID",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _eid,
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
              Text("Course ID",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _cid,
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
              Text("Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _date,
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
              Text("Duration",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _duration,
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
              Text("Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.deepOrangeAccent),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: new TextFormField(
                  controller: _time,
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
        title: new Text("Exam Registration"),
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



  void _data() {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("Exam").doc(_eid.text).set(
        {
          "Exam_id" : _eid.text,
          "Course_id" : _cid.text,
          "Date" : _date.text,
          "time" : _time.text,
          "duration" : _duration.text,
        }).then((_){
      print(firebaseUser);
    });
  }

  void clearText() {
    _cid.clear();
    _eid.clear();
    _date.clear();
    _duration.clear();
    _time.clear();
  }



}
