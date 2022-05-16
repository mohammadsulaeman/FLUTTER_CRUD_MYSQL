import 'package:crud_mysql/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDataPages extends StatefulWidget {
  final List list;
  final int index;

  EditDataPages({required this.index, required this.list});
  @override
  State<EditDataPages> createState() => _EditDataPagesState();
}

class _EditDataPagesState extends State<EditDataPages> {
  TextEditingController ItemNameController = TextEditingController();
  TextEditingController ItemCodeController = TextEditingController();
  TextEditingController ItemPriceController = TextEditingController();
  TextEditingController ItemStockController = TextEditingController();

  var url = Uri.parse("http://192.168.108.108/MyStoreku/edidata.php");
  void editData() {
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": ItemCodeController.text,
      "itemname": ItemNameController.text,
      "price": ItemPriceController.text,
      "stock": ItemStockController.text
    });
  }

  @override
  void initState() {
    ItemCodeController =
        TextEditingController(text: widget.list[widget.index]['item_code']);
    ItemNameController =
        TextEditingController(text: widget.list[widget.index]['item_name']);
    ItemPriceController =
        TextEditingController(text: widget.list[widget.index]['price']);
    ItemStockController =
        TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EDIT DATA'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
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
                  editData();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const MyHomePage())));
                },
                child: const Text('EDIT DATA'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
