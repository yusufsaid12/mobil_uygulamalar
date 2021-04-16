import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}


class _BenimStatim extends State<BenimUygulamam>{
  final String deger = "Merhaba stateless";
  final TextEditingController tec = TextEditingController();

@override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context){
       return MaterialApp(
         home:Scaffold(
          body:Container(
            child:Column(
              children:<Widget>[
                TextField(controller:tec,),
                TextButton(
                  clipBehavior: Clip.none,
                  autofocus: true,
                  onPressed: (){ },
                  child: Text('Değiştir!'),
                ),
                Text(deger,),
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