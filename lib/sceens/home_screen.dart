// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   //   المعالج جزء من ...
//   List nameQuize = ['الحاسوب', 'الطيارة', 'الشجرة'];
//   int checkQuize = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 11, 170, 243),
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(children: [
//           Container(
//               decoration: BoxDecoration(
//                   color: Colors.amber, borderRadius: BorderRadius.circular(25)),
//               margin: EdgeInsets.all(5),
//               width: 300,
//               child: const Center(
//                 child: Text(
//                   'المعالج جزء من ...',
//                   style: TextStyle(fontSize: 40),
//                 ),
//               )),
//           _inkWell(0),
//           _inkWell(1),
//           _inkWell(2),
//           const SizedBox(height: 40),
//         ]),
//       ),
//     );
//   }

//   InkWell _inkWell(int i) {
//     return InkWell(
//       onTap: (() {
//         setState(() {
//           checkQuize = i;
//         });
//       }),
//       child: Container(
//           margin: EdgeInsets.all(2),
//           color: checkQuize == i ? Colors.red : Colors.black54,
//           width: 300,
//           child: Center(
//             child: Text(
//               '${nameQuize[i]}',
//               style: TextStyle(fontSize: 40),
//             ),
//           )),
//     );
//   }
// }
