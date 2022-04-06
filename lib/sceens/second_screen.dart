import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quize/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int nextQuize = 0;
  List<int> checkQuize = [1, 1, 1];
  List<int> check = [1, 1, 1];
  int resultQuize = 0;
  int secondScreen = 0;
  bool checkSelectValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondScreen < indexSol.length
          ? Color.fromARGB(255, 255, 255, 255)
          : Color.fromARGB(255, 225, 195, 195),
      body: secondScreen < indexSol.length
          ? bodyHome()
          : SafeArea(
              child: Center(
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Color.fromARGB(255, 7, 255, 238),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End Quize\n\n      $resultQuize/${indexSol.length}',
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CupertinoButton(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(171, 7, 114, 201),
                        child: const Text(
                          'إعادة الاختبار ',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        onPressed: () => setState(() {
                              nextQuize = 0;
                              secondScreen = 0;
                              resultQuize = 0;
                              checkQuize = [1, 1, 1];
                            })),
                  ],
                ),
              ),
            )),
    );
  }

  Column cont(Set givSet) {
    List quizeSet = givSet.toList();

    return Column(
      children: [
        for (int i = 0; i < quizeSet.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              highlightColor: Colors.amber,
              splashColor: Colors.amber,
              borderRadius: BorderRadius.circular(15),
              onTap: () => setState(() {
                checkQuize = [1, 1, 1];
                checkQuize[i] = checkQuize[i] == 0 ? 1 : 0;
                checkSelectValue = indexSol[nextQuize] == i ? true : false;
              }),
              child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: checkQuize[i] == 0
                        ? const Color.fromARGB(255, 176, 165, 165)
                        : const Color.fromARGB(255, 250, 235, 235),
                  ),
                  width: 300,
                  child: Center(
                    child: Text(
                      '${quizeSet[i]}',
                      style: const TextStyle(fontSize: 35),
                    ),
                  )),
            ),
          ),
      ],
    );
  }

  bodyHome() {
    return SafeArea(
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(171, 7, 114, 201),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 2)),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.96,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Text(
                  qusion[nextQuize],
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(245, 252, 252, 252)),
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          cont(quizeList[nextQuize]),
          const SizedBox(
            height: 70,
          ),
          CupertinoButton(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(171, 7, 114, 201),
              child: const Text(
                'السؤال التالي',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              onPressed: () => setState(() {
                    nextQuize += nextQuize < quizeList.length - 1 &&
                            (checkQuize[0] != 1 ||
                                checkQuize[1] != 1 ||
                                checkQuize[2] != 1)
                        ? 1
                        : 0;
                    secondScreen++;
                    resultQuize += checkSelectValue ? 1 : 0;

                    checkQuize = [1, 1, 1];
                  })),
          const SizedBox(
            height: 70,
          ),
        ]),
      ),
    );
  }
}
