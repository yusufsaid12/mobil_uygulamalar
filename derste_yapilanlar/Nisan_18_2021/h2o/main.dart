import 'package:flutter/material.dart';

void main() {
  runApp(H2oOyun());
}

class H2oOyun extends StatefulWidget {
  @override
  _H2oOyunState createState() => _H2oOyunState();
}

//extends örnek; Otomobil extends Arac
//extends örnek; Ucak extends Arac
class _H2oOyunState extends State<H2oOyun> {

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();

  }

  void calistir(){


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          children: <Widget>[
            Container(
              child:Text("Rastgele sayı metni"),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: TextButton(
                      autofocus: false,
                      clipBehavior: Clip.none,
                      child: Image.asset("assets/buz.png") ,
                      onPressed:(){calistir();},
                    ),
                  ),
                  Container(
                    child: TextButton(
                      autofocus: false,
                      clipBehavior: Clip.none,
                      child: Image.asset("assets/su.png"),
                      onPressed:(){calistir();},
                    ),
                  ),
                  Container(
                    child: TextButton(
                      autofocus: false,
                      clipBehavior: Clip.none,
                      child: Image.asset("assets/buhar.png"),
                      onPressed:(){calistir();},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text("Sonuç metni"),
            ),
          ],
        ),
    );
  }
}