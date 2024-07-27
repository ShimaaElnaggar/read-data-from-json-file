import 'package:flutter/material.dart';
import 'package:read_data_from_json_file/models/user.dart';

class GridViewItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final String email;
  final String phone;
  final String image;
  final Address? address;

  const GridViewItem(
      {required this.address,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.age,
      required this.email,
      required this.image,
      required this.phone,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.grey),
        ),
        shadowColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.network(
                      image,
                      height: 65,
                      width: 65,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$firstName $lastName',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          gender,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildContainer(email),
                    const SizedBox(
                      width: 5,
                    ),
                    buildContainer(phone),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildContainer(address?.address?.toString() ?? ''),
                  buildContainer(address?.state?.toString() ?? 'Not Found'),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildContainer(address?.city?.toString() ?? ''),
                  buildContainer(address?.country?.toString() ?? ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String? text) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text ?? '',
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
