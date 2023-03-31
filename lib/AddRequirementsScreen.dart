import 'package:flutter/material.dart';
import 'package:project100/shop_model.dart';

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
    List requirementsList = shopsList[widget.shopIndex]['Requirements'];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: ElevatedButton(
                  onPressed: () {
                    requirementsList.add({
                      'name': 'name1',
                      'qty': 3,
                      'rate': 500,
                    });
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text('add')),
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: requirementsList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Text(
                requirementsList[index]['name'],
              ),
              title: Text(
                requirementsList[index]['qty'].toString(),
              ),
              trailing: Text(
                '${requirementsList[index]['qty'] * requirementsList[index]['rate']}',
              ),
            ),
          ),
        ));
  }
}
