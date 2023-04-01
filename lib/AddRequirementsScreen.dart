
import 'package:flutter/material.dart';
import 'package:project100/shop_model.dart';

import 'constant.dart';

class AddRequirementsScreen extends StatefulWidget {
  const AddRequirementsScreen({Key? key, required this.shopIndex})
      : super(key: key);
  final int shopIndex;

  @override
  State<AddRequirementsScreen> createState() => _AddRequirementsScreenState();
}

class _AddRequirementsScreenState extends State<AddRequirementsScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController itemName = TextEditingController();
    final TextEditingController itemQty = TextEditingController();
    final TextEditingController itemRate = TextEditingController();



    List? requirementsList = shopsList[widget.shopIndex]['Requirements'] ;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: main_color,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  TextField(
                    controller: itemName,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: itemQty,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: itemRate,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if( requirementsList == null){
                          requirementsList = [];
                        }
                        requirementsList!.add({
                          'name': itemName.text,
                          'qty': double.parse(itemQty.text),
                          'rate': double.parse(itemRate.text),
                        });
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Text('add')),
                ],
              ),
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: requirementsList == null ? Center(child: Text('Add items'),) : Center(
          child: ListView.builder(
              itemCount:requirementsList!.length ,
              itemBuilder: (context, index) {
                num totalItemRate = requirementsList![index]['qty'] * requirementsList![index]['rate'];
                return SizedBox(
                  height: 80,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          requirementsList![index]['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
                        ),
                      ),
                      title: Text(
                        requirementsList![index]['qty'].toString(),style: TextStyle(fontSize: 20) ,
                      ),
                      trailing: Text(
                        '$totalItemRate' ,style: TextStyle(fontSize: 20) ,
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}

