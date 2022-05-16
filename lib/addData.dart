import 'package:crud_mysql/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataPages extends StatefulWidget {
  const AddDataPages({Key? key}) : super(key: key);

  @override
  State<AddDataPages> createState() => _AddDataPagesState();
}

class _AddDataPagesState extends State<AddDataPages> {
  TextEditingController ItemNameController = TextEditingController();
  TextEditingController ItemCodeController = TextEditingController();
  TextEditingController ItemPriceController = TextEditingController();
  TextEditingController ItemStockController = TextEditingController();
  var url = Uri.parse("http://192.168.108.108/MyStoreku/adddata.php");
  void addData() {
    http.post(url, body: {
      "itemcode": ItemCodeController.text,
      "itemname": ItemNameController.text,
      "price": ItemPriceController.text,
      "stock": ItemStockController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tambah Data Store',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Item Code',
                      labelText: 'Item Code',
                      border: OutlineInputBorder(),
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  controller: ItemCodeController,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Item Name',
                      labelText: 'Item Name',
                      border: OutlineInputBorder(),
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  controller: ItemNameController,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Item Price',
                      labelText: 'Item Price',
                      border: OutlineInputBorder(),
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  controller: ItemPriceController,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Item Stock',
                      labelText: 'Item Stock',
                      border: OutlineInputBorder(),
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  controller: ItemStockController,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  addData();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => MyHomePage())));
                },
                child: const Text('ADD DATA'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
