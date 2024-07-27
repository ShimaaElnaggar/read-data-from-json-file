import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:read_data_from_json_file/models/user.dart';
import 'package:read_data_from_json_file/widgets/grid_view_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<User> usersList = [];
  bool isLoading = false;
  String errorMessage = '';
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  void fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    var result = await rootBundle.loadString('assets/data.json');
    var response = jsonDecode(result); //json
    if (response['success']) {
      usersList = List<User>.from(
          response['users'].map((e) => User.fromJson(e)).toList());
    } else {
      errorMessage =
          "There is an Error : ' Your status code is = ${response['statusCode'] ?? 'UnKnown error'} '";
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    children: usersList
                        .map((e) => GridViewItem(
                              phone: e.phone ?? '',
                              firstName: e.firstName ?? '',
                              lastName: e.lastName ?? '',
                              gender: e.gender ?? '',
                              age: e.age ?? 0,
                              email: e.email ?? '',
                              image: e.image ?? '',
                              address: e.address,
                            ))
                        .toList(),
                  ),
                )
              : Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
    );
  }
}
