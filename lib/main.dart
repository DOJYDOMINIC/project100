import 'package:flutter/material.dart';
import 'package:project100/AddRequirementsScreen.dart';
import 'package:project100/shop_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopListScreen(),
    );
  }
}

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController shopName = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            child: Column(
              children: [
                TextField(
                  controller: shopName,
                ),
                ElevatedButton(
                    onPressed: () {
                      shopsList.add({
                        'name': shopName.text,
                        'requirements': [],
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
      body: ListView.builder(
        itemCount: shopsList.length,
        itemBuilder: (context, index) => SizedBox(
          height: 120,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddRequirementsScreen(shopIndex: index),
                  ));
            },
            child: Card(
                color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(child: Text(shopsList[index]['name']))),
          ),
        ),
      ),
    );
  }
}
