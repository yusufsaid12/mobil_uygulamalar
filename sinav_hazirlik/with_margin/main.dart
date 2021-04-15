import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text('Karşılama', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.grey[500])),
        ),
        
        body: SafeArea(
            child:Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
				Container(
				color: Colors.grey[200],
					child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400] ,
            border: Border.all(color: Colors.black, width: 10,)
            ),
						margin: EdgeInsets.all(50),
						child: Container(
							alignment: Alignment.center,
							color: Colors.white,
							width: 240,
							height: 80,
							child:Text('Merhaba Flutter!', style: TextStyle(fontSize:24, color: Colors.grey[800])),
                      ),
                ),
				),
                      
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}


