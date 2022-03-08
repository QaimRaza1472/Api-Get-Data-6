import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class DashBoard extends StatelessWidget {
  final int id;
  final String title;
  final String thumbNail;

  const DashBoard({
    Key? key,
    required this.id,
    required this.title,
    required this.thumbNail,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                  image: NetworkImage(thumbNail,
                  ),),

            ),
          ),

          Text(id.toString(),
          style: const TextStyle(
            fontSize: 45,
          ),
          ),
          Container(
            width: double.infinity,
            //color: Colors.yellow,
            child: Center(
              child: Text(title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
