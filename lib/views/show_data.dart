import 'package:flutter/material.dart';

import 'package:read_data_from_json_file/models/user.dart';

class ShowData extends StatefulWidget {
  final User? user;
  final Function deleteUSer;
  const ShowData({required this.deleteUSer, required this.user, super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.grey),
            ),
            shadowColor: Colors.blue,
            child: ListTile(
              leading: Image.network(widget.user?.image ?? ''),
              title: Text(widget.user?.firstName ?? ''),
              subtitle: Text(widget.user?.email ?? ''),
              trailing: IconButton(
                  onPressed: () {
                    widget.deleteUSer(widget.user);
                    Navigator.of(context).pop(true);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
