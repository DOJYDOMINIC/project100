

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
      backgroundColor: back_color,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Item List'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: main_color,
      ),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount:requirementsList!.length ,
                itemBuilder: (context, index) {
                  num totalItemRate = requirementsList![index]['qty'] * requirementsList![index]['rate'];
                  return SizedBox(
                    height: 80,
                    child: Card(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Text(
                          requirementsList![index]['name'],style: comnfnt,
                        ),
                        title: Text(
                          requirementsList![index]['qty'].toString(),style: comnfnt
                        ),
                        trailing: Text(
                          '$totalItemRate' ,style: comnfnt) ,
                        ),
                      ),

                  );
                }),
          ),
        ));
  }
}

