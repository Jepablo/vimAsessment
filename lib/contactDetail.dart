import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  String? user,phone,clock;
  ContactDetail({Key? key,this.user,this.phone,this.clock}) : super(key: key);

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {

  @override
  Widget build(BuildContext context) {
    String? name = widget.user;
    String? phone = widget.phone;
    String? clock = widget.clock;
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(columns: const [
              DataColumn(
                  label: Text('Name',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
              ),
              DataColumn(
                label: Text('Phone',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
              ),
              DataColumn(
                label: Text('Clock-In',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(name!,overflow: TextOverflow.ellipsis,style: const TextStyle(
                    fontSize: 15,
                  ),)),
                  DataCell(Text(phone!,style: const TextStyle(
                    fontSize: 15,
                  ),)),
                  DataCell(Text(clock!,style: const TextStyle(
                    fontSize: 14,
                  ),)),
                ])
              ],
            )
          ],
        ),
      )
    );

  }
}
