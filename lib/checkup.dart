// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final allChecked = CheckBoxModal(title: 'Select All');
//   final checkBoxList = [
//     CheckBoxModal(title: 'Carpentry'),
//     CheckBoxModal(title: 'Plumbing'),
//     CheckBoxModal(title: 'Electrics'),
//     CheckBoxModal(title: 'Painting')
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text('Available Services')),
//         body: ListView(
//           children: [
//             ListTile(
//               onTap: () => onAllClicked(allChecked),
//               leading: Checkbox(
//                 value: allChecked.value,
//                 onChanged: (value) => onAllClicked(allChecked),
//               ),
//               title: Text(allChecked.title,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//             Divider(),
//             ...checkBoxList
//                 .map(
//                   (item) => ListTile(
//                     onTap: () => onItemClicked(item),
//                     leading: Checkbox(
//                       value: item.value,
//                       onChanged: (value) => onItemClicked(item),
//                     ),
//                     title: Text(item.title,
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                 )
//                 .toList()
//           ],
//         ),
//       ),
//     );
//   }
//
//   onAllClicked(CheckBoxModal ckbItem) {
//     final newValue = !ckbItem.value;
//     setState(() {
//       ckbItem.value = newValue;
//       checkBoxList.forEach((element) {
//         element.value = newValue;
//       });
//     });
//   }
//
//   onItemClicked(CheckBoxModal ckbItem) {
//     final newValue = !ckbItem.value;
//     setState(() {
//       ckbItem.value = newValue;
//
//       if (!newValue) {
//         allChecked.value = false;
//       } else {
//         final allListChecked = checkBoxList.every((element) => element.value);
//         allChecked.value = allListChecked;
//       }
//     });
//   }
// }
//
// class CheckBoxModal {
//   String title;
//   bool value;
//
//   CheckBoxModal({required this.title, this.value = false});
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckUp extends StatelessWidget {
  Map<String, List<String>> symtptoms;
  CheckUp({Key? key, required this.symtptoms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Symptom(symtptoms),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Symptom extends StatefulWidget {
  Map<String, List<String>> symtptoms;
  Symptom(this.symtptoms, {Key? key}) : super(key: key);

  @override
  _SymptomState createState() => _SymptomState();
}

class _SymptomState extends State<Symptom> {
  final allChecked = CheckBoxModal(title: 'Select All');
  late List<CheckBoxModal> checkBoxList;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    checkBoxList = List.generate(
        widget.symtptoms.length,
        (index) =>
            CheckBoxModal(title: widget.symtptoms.keys.elementAt(index)));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Check-Up: Please select symptoms')),
        body: ListView(
          children: [
            ListTile(
              onTap: () => onAllClicked(allChecked),
              leading: Checkbox(
                value: allChecked.value,
                onChanged: (value) {},
              ),
              title: Text("Select All",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            ...List.generate(
                checkBoxList.length,
                (index) => ListTile(
                      onTap: () => onItemClicked(checkBoxList.elementAt(index)),
                      leading: Checkbox(
                        value: checkBoxList[index].value,
                        onChanged: (value) =>
                            onItemClicked(checkBoxList.elementAt(index)),
                      ),
                      title: Text(
                        widget.symtptoms.keys.elementAt(index),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  onAllClicked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        allChecked.value = false;
      } else {
        // final allListChecked = checkBoxList.every((element) => element.value);
        // ele.value = allListChecked;
      }
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({required this.title, this.value = false});
}
