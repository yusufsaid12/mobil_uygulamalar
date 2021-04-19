import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(BuzSuBuhar());
}

class _BenimStatim extends State<BuzSuBuhar>{
  var numGenerator = new Random();
  String sonucMetin="";
  int deger=0;
  final TextEditingController tec = TextEditingController();

  int degeriRastgeleOlustur(){
    int pozitif = numGenerator.nextInt(1);
    int rastgele =0;
    if(pozitif == 1){
        rastgele = numGenerator.nextInt(273);
    }
    else{
        rastgele = 0 - numGenerator.nextInt(273);
    }
    return rastgele;
  }

@override
  void initState() {
    
    deger = degeriRastgeleOlustur();
    super.initState();
  }



  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  void yenile(){
    
    setState((){
      deger = degeriRastgeleOlustur();
    });

  }

  void onPressed(int state){
    print(deger.toString()+" "+state.toString());
    setState(() {
      if(deger < 0 && state < 0){
        sonucMetin = "Evet," + deger.toString()+ " derecede H2O buzdur.";
      }else if(deger < 100 && deger > 0 && state == 0){
        sonucMetin = "Evet," + deger.toString()+ " derecede H2O sudur.";
      }else if(deger > 100 && state > 0){
        sonucMetin = "Evet," + deger.toString()+ " derecede H2O buhardır.";
      }else{
        sonucMetin = "Hayır, biraz daha fen bilgisi çalışmalısın.";
      }
      
    });

  }


   @override
   Widget build(BuildContext context){
     
       return MaterialApp(
         home:Scaffold(
          body:Container(
            child:Column(
              children:<Widget>[
                Container(
                  child:Text(deger.toString(),style: TextStyle(
                      color: Colors.blue,
                      fontSize: 48,
                    ),
                  ),
                ),
                Container(
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Flexible(child:
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          widthFactor:1,
                          child: Container(
                            height:120,
                            child: 
                            TextButton(
                              clipBehavior: Clip.none,
                              autofocus: false,
                              onPressed: (){ onPressed(-1); },
                              child: Image.asset('assets/ice.png'),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape:  BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all( color: Colors.blueAccent,),
                            ),
                        ),
                        ),
                        ),
                        Flexible(child: 
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          widthFactor:1,
                          child:Container(
                            height:120,
                            child: TextButton(
                              clipBehavior: Clip.none,
                              autofocus: false,
                              onPressed: (){ onPressed(0); },
                              child: Image.asset('assets/water.png'),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape:  BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all( color: Colors.blueAccent,),
                            ),
                        ),
                        ),
                        ),
                        Flexible(child:
                        FractionallySizedBox(
                           alignment: Alignment.topCenter,
                          widthFactor:1,
                          child:Container(
                            height:120,
                            child:
                            TextButton(
                              clipBehavior: Clip.none,
                              autofocus: false,
                              onPressed: (){ onPressed(1); },
                              child: Image.asset('assets/steam.png'),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape:  BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all( color: Colors.blueAccent,),
                            ),
                        ),
                        ),
                        ),
                      ]
                    ),
                ),
                Container(
                  child:Text(sonucMetin, style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                ),
                ),
              ],
            ),
          ),
         ),
       );

     } 
  
   
}

class BuzSuBuhar extends StatefulWidget {
   @override
  _BenimStatim createState() => _BenimStatim();


}
