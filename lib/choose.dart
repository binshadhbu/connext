import 'package:flutter/material.dart';

class choose extends StatefulWidget {
  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                Expanded(
                  child:FractionallySizedBox(
                    widthFactor: 0.5,
                    child:Image.network('https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
                    fit: BoxFit.cover),
                  ),
                ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/post');
                        },
                        child: Text('JEE'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/postneet');
                        },
                        child: Text('NEET'),
                    ),
                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}
