import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_tes/ui/screen3.dart';

import '../model/respons.dart';

class SecondScreen extends StatelessWidget {
  final Datum? data;

  const SecondScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    String name = data?.firstName ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Second Screen"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text("Welcome"),
          Text(name),
          const Expanded(
            child: Center(
              child: Text(
                "Selected User Name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  width: 310,
                  height: 41.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF2B637B),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const Text(
                    "Choose a User",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdScreen()));
                }),
          ),
        ]),
      ),
    );
  }
}
