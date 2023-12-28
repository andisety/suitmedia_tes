import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_tes/ui/screen2.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_photo.png',
                  height: 116,
                  width: 116,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 51.0),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Palindrome',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45.0),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: 310,
                      height: 41.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2B637B),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Text(
                        "CHECK",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () {
                      // _login();
                    }),
                const SizedBox(height: 15.0),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: 310,
                      height: 41.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2B637B),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()));
                    }),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
