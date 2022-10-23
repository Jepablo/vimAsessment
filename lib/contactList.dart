import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'contactDetail.dart';

// class ContactList extends StatefulWidget {
//   const ContactList({Key? key}) : super(key: key);
//
//   @override
//   State<ContactList> createState() => _ContactListState();
// }
//
// class _ContactListState extends State<ContactList> {
//   final dateStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//   final List<String> names = <String>[
//     'Chan Saw Lin','Lee Saw Loy','Khaw Tong Lin','Lim Kok Lin',"Low Jun Wei","Yong Weng Kai", "Jayden Lee","Kong Kah Yan", "Jasmine Lau","Chan Saw Lin"
//   ];
//  
//   final List<String> phone = <String>['0152131113','0161231346','0158398109','0168279101',"0112731912", "0172332743","0191236439","0111931233", "0162879190", "016783239"
//   ];
//   final List<String> clock = <String>['2020-06-30 16:10:05',' 2020-07-11 15:39:59',' 2020-08-19 11:10:18',' 2020-08-19 11:11:35','2020-08-15 13:00:05','2020-07-31 18:10:11',
//     '2020-08-22 08:10:38', '2020-07-11 12:00:00', ' 2020-08-01 12:10:05', '2020-08-23 11:59:05'
//   ];
//   // //found user boleh delete
//   // List<Map<String,dynamic>> _foundUsers = [];
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   void addItemToList(){
//     setState(() {
//       names.insert(0,nameController.text);
//       phone.insert(0, phoneController.text);
//       clock.insert(0,dateStr);
//
//     });
//   }
//   @override
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Contact List'),
//         ),
//         body: Column(
//             children: <Widget>[
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Name',
//                 ),
//               ),
//               TextField(
//                 controller: phoneController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Phone Number',
//                 ),
//               ),
//                TextField(
//                 decoration: InputDecoration(
//                     labelText: 'Search',suffixIcon: Icon(Icons.search)),
//               ),
//               // ),
//               RaisedButton(
//                 child: Text('Add'),
//                 onPressed: () {
//                   Fluttertoast.showToast(msg: "Contact Added");
//                   addItemToList();
//                 },
//               ),
//               Expanded(
//                   child: ListView.builder(
//                       padding: const EdgeInsets.all(8),
//                       itemCount: names.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                           child: ListTile(
//                             title: Text(' Name: ${names[index]}\n Phone: ${phone[index]}\n Date:${clock[index]}',
//                               style: TextStyle(fontSize: 12),
//                             ),
//                             onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ContactDetail(user: names[index],phone:phone[index],clock:clock[index])));
//                             },
//                           ),
//                         );
//                       }
//                   )
//               )
//             ]
//         )
//     );
//   }
// }

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final dateStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Chan Saw Lin", "phone": "0152131113" ,"Clock-In" : "2020-06-30 16:10:05"},
    {"name": "Kong Kah Yan", "phone": "0111931233","Clock-In" : "2020-07-11 12:00:00"},
    {"name": "Lee Saw Loy", "phone": "0161231346","Clock-In" : "2020-07-11 15:39:59"},
    {"name": "Yong Weng Kai", "phone": "0172332743","Clock-In" : "2020-07-31 18:10:11"},
    {"name": "Jasmine Lau", "phone": "0162879190","Clock-In" : "2020-08-01 12:10:05"},
    {"name": "Low Jun Wei", "phone": "0112731912","Clock-In" : "2020-08-15 13:00:05"},
    {"name": "Khaw Tong Lin", "phone": "0158398109","Clock-In" : "2020-08-19 11:10:18"},
    {"name": "Lim Kok Lin", "phone": "0168279101","Clock-In" : "2020-08-19 11:11:35"},
    {"name": "Jayden Lee", "phone": "0191236439","Clock-In" : "2020-08-22 08:10:38"},
    {"name": "Chan Saw Lin", "phone": "016783239","Clock-In" : "2020-08-23 11:59:05"},
  ];
  void sort() {
    _allUsers.sort((a, b) => b['Clock-In'].compareTo(a['Clock-In']));
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void addItemToList() {
    setState(() {
      _allUsers.add({
        "name":nameController.text,
        "phone":phoneController.text,
        "Clock-In" : dateStr
      });
    });
  }
  //  hold data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }


  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState((){
      _foundUsers = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    var detail = _ContactListState();
    detail.sort();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 15),
            TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            const SizedBox(height: 15),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 5),
            RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Contact Added");
                  addItemToList();
                },
              ),
            const SizedBox(height: 20,),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["name"]),
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(_foundUsers[index]['name'], style:const TextStyle(
                        color:Colors.white
                    )),
                    subtitle: Text(
                        '${_foundUsers[index]["phone"]}\n' + '${_foundUsers[index]["Clock-In"]}',style:const TextStyle(
                        color:Colors.white
                    )),
                    onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>
                          ContactDetail(user: _foundUsers[index]["name"],
                              phone: _foundUsers[index]["phone"],
                              clock: _foundUsers[index]["Clock-In"])));
                      }
                    ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

