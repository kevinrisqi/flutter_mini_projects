import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';

class SecondPage extends StatefulWidget {
   SecondPage({super.key, this.datas});

  List<String>? datas;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Second Page'),
      body: Column(
        children: [
          const Text('List Data'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.datas!.length,
            itemBuilder: (context, index) {
              var data = widget.datas![index];
              return ListTile(
                title: Text(data),
                trailing: InkWell(
                  onTap: () {
                    setState(() {
                      widget.datas!.removeAt(index);
                    });
                  },
                  child: const Icon(Icons.minimize),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
