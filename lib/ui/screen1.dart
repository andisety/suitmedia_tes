import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_tes/ui/screen2.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();

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
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: sentenceController,
                        decoration: const InputDecoration(
                          hintText: 'Palindrome',
                          border: InputBorder.none,
                        ),
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
                      checkPalindrome();
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

  void checkPalindrome() {
    String sentence = sentenceController.text.toLowerCase().replaceAll(' ', '');
    String reversedSentence = sentence.split('').reversed.join('');

    if (sentence == reversedSentence) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Palindrome'),
            content: Text('The sentence is a palindrome.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Not Palindrome'),
            content: Text('The sentence is not a palindrome.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
