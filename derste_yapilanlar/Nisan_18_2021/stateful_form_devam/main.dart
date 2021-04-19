import 'package:flutter/material.dart';

void main() {
  runApp(StatefulFormDevam());
}

class StatefulFormDevam extends StatefulWidget{
     _StatefulFormDevamIcinState  createState() => _StatefulFormDevamIcinState();
}

//Bir State'i extend eden state sınıfı
//Bazı metotları override etmesi lazım
//extends anahtar kelimesi ile State sınıfından bir sınıf türetilmiş
//extends örnek; Otomobil extends Arac
//extends örnek; Ucak extends Arac
class _StatefulFormDevamIcinState extends State<StatefulFormDevam>{
  String deger = "Initial text";
  TextEditingController tec = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void onPressed(){
    setState((){
      deger = tec.text;
    });

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(controller:tec),
              ),
              Container(
                child:TextButton(
                  clipBehavior: Clip.none,
                  autofocus: false,
                  onPressed:(){ onPressed();},
                  child: Text('Değiştir'),
                ),
              ),
              Container(
                child : Text(deger),
              ),
              
            ],

          ),

        ),
      ),

    );

  }
}



