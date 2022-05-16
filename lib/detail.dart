import 'package:crud_mysql/editdata.dart';
import 'package:crud_mysql/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var url = Uri.parse("http://192.168.108.108/MyStoreku/deletedata.php");
  void deleteData() {
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
    });
  }

  Future<void> confirm() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                "Apa Anda Yakin Menghapus Data Ini ? ${widget.list[widget.index]['item_name']}"),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  deleteData();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const MyHomePage())));
                },
                child: const Text('YAKIN'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('CANCEL'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(30)),
                Text("Item Code : ${widget.list[widget.index]['item_code']}"),
                Text("Item Name : ${widget.list[widget.index]['item_name']}"),
                Text("Harga : ${widget.list[widget.index]['price']}"),
                Text("Stock : ${widget.list[widget.index]['stock']}"),
                const Padding(padding: EdgeInsets.all(30)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => EditDataPages(
                                index: widget.index, list: widget.list))));
                      },
                      color: Colors.green,
                      child: const Text(
                        'Edit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        confirm();
                      },
                      color: Colors.red,
                      child: const Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
