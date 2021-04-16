import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class _BenimStatim extends State<BenimUygulamam>{
  final String deger = "Merhaba stateless";
   
   @override
   Widget build(BuildContext context){
       return MaterialApp(
         home:Scaffold(
          body:Container(
            child:Column(
              children:<Widget>[
                TextField(),
                TextButton(
                  clipBehavior: Clip.none,
                  autofocus: true,
                  onPressed: (){},
                  child: Text('Değiştir!'),
                ),
                Text('Merhaba stateless widget!',),
              ],
            ),
          ),
         ),
       );

     } 
  
   
}

class BenimUygulamam extends StatefulWidget{
  
  @override
  _BenimStatim createState() => _BenimStatim();


}

/*

*/