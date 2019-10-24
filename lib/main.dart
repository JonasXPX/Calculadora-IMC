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
  
  TextEditingController weightController = TextEditingController();
  TextEditingController heigthController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heigthController.text = "";
      _infoText = "Informe seus dados!"; 
    });
  }

  void calculate() {
    if(heigthController.text == "" || weightController.text == "") {
      return;
    }

    double weight = double.parse(weightController.text);
    double height = double.parse(heigthController.text) / 100;

    double imc = weight / (height * height);

    print("Height ${height} - Weight ${weight}");

    print(imc);
      setState(() {
        if(imc < 18.6) {
            _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})"; 
        } else if (imc >= 18.6 && imc <= 24.9) {
            _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})"; 
        } else if (imc >= 25.0 && imc <= 29.9) {
            _infoText = "Levemente Acima do peso (${imc.toStringAsPrecision(4)})"; 
        } else if (imc >= 30.0 && imc <= 34.9) {
            _infoText = "Obesidade 1º (${imc.toStringAsPrecision(4)})"; 
        } else if (imc >= 35.0 && imc <= 39.9) {
            _infoText = "Obesidade 2º (severa) (${imc.toStringAsPrecision(4)})"; 
        } else if (imc >= 40.0) {
            _infoText = "Obesidade 3º (mórbida) (${imc.toStringAsPrecision(4)})"; 
        }
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
            onPressed: _resetFields,
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
                controller: weightController,
              ),
            
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: _textColor),
                ),
                textAlign: TextAlign.center,
                controller: heigthController,
              ),

              AnimatedPadding(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(padValue),
                child: Container(
                    height: 50.0,
                    margin: EdgeInsets.all(5.0),
                    child: RaisedButton(
                        onPressed: calculate,
                        child: Text("Calcular", style: TextStyle(color: _textColor, fontSize: 23.0),),
                        color: Color.fromRGBO(232, 197, 71, 1),
                      ),
                  ),
              ),
              Text(_infoText, textAlign: TextAlign.center, style: TextStyle(color: _textColor, fontSize: 25.0),)
          ],
        ),
      ),
    );
  }
} 