import 'dart:math';

import 'package:buoi4/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class createpage extends StatefulWidget {
  const createpage({super.key});

  @override
  State<createpage> createState() => _createpageState();
}

class _createpageState extends State<createpage> {
  final namectl = TextEditingController();
  final emailctl = TextEditingController();
  final passwordctl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'glad to see you!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
          Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: namectl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Name',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: emailctl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Email',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordctl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () async {
                      try {
                        final data = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailctl.text,
                                password: passwordctl.text);

                        if (data.user != null) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('Thanh Cong'),
                                  content: Text('Dang ki thanh cong'),
                                );
                              });
                        }
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Loi'),
                                content: Text(e.toString()),
                              );
                            });
                      }
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 70,
            width: double.infinity,
            child: Container(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginpage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
