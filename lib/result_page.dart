import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.results);
  List<String> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Container(
          width: double.infinity,
          child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${results[index]}'),
                );
              })),
    );
  }
}
