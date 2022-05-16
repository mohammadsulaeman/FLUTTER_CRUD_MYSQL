import 'dart:convert';

import 'package:crud_mysql/addData.dart';
import 'package:crud_mysql/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = Uri.parse("http://192.168.108.108/MyStoreku/getdata.php");
  Future<List> getDataStore() async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Store Ku',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const AddDataPages())));
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List>(
          future: getDataStore(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(
                    list: snapshot.data!,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => Detail(index: i, list: list)))),
              child: Card(
                child: ListTile(
                  title: Text(list[i]['item_name']),
                  leading: const Icon(Icons.widgets),
                  subtitle: Text('Stock : ${list[i]['stock']}'),
                ),
              ),
            ),
          );
        });
  }
}
