import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Color _textColor = Color.fromRGBO(51, 67, 85, 1);
  double padValue = 3;

  void updateState(double value) {
    setState(() {
     padValue = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(51, 67, 85, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){},
          )
        ],
      ),

      backgroundColor: Color.fromRGBO(119, 141, 169, 1),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120, color: Color.fromRGBO(232, 197, 71, 1),),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: _textColor),
                ),
                textAlign: TextAlign.center,
              ),
            
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: _textColor),
                ),
                textAlign: TextAlign.center,
              // onEditingComplete: _updatedPadding(),
              ),

              AnimatedPadding(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(padValue),
                child: Container(
                    height: 50.0,
                    margin: EdgeInsets.all(5.0),
                    child: RaisedButton(
                        onPressed: (){},
                        child: Text("Calcular", style: TextStyle(color: _textColor, fontSize: 23.0),),
                        color: Color.fromRGBO(232, 197, 71, 1),
                      ),
                  ),
              ),
              Text("Info", textAlign: TextAlign.center, style: TextStyle(color: _textColor, fontSize: 25.0),)
          ],
        ),
      ),
    );
  }
} 