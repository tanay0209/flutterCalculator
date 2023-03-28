import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main()
{
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);




  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String displayString = '0';
  String resultString = '';
  String number = '0';
  double fontSize = 40.0;

  void calculatorFunction(String buttonValue)
  {
     if(buttonValue == '+' || buttonValue == '-' || buttonValue == '*' || buttonValue == '/' )
      {
        fontSize = 40.0;
        if(buttonValue == '+')
          {
            displayString = displayString + buttonValue;

          }
        else if(buttonValue == '*')
        {
          displayString = displayString + buttonValue;
        }
        else if(buttonValue == '-')
        {
          displayString = displayString + buttonValue;
        }
        else if(buttonValue == '/')
        {
          displayString = displayString + buttonValue;
        }
      }
     else if(buttonValue == 'C')
       {
         displayString = '0';
         resultString = '';
         fontSize = 40.0;
       }
     else if(buttonValue == '=') {
       try {
         Parser p = Parser();
         Expression exp = p.parse(displayString);
         ContextModel cm = ContextModel();
         resultString = '${exp.evaluate(EvaluationType.REAL, cm)}';
         displayString = resultString;
         fontSize = 55.0;
       }
       catch (e) {
         displayString = 'Error';
       }
     }
     else
      {
        fontSize = 40.0;
        number = number + buttonValue;
        if(displayString == '0')
          {
            displayString = buttonValue;
          }
        else
          {
            displayString = displayString + buttonValue;
          }

      }
    setState(() {
    });
  }

  Widget customBtn (String value , Color bgcolor , Color txtColor ) {
    return Expanded(
        child:Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24),
             backgroundColor: bgcolor
            ),
            onPressed: () => calculatorFunction(value),
            child: Text(value,
            style: TextStyle(
              fontSize: 30,
              color: txtColor
            ),
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('Calculator',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w700
        ),
        ),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  resultString,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500
                  ),
                ),
          )
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  displayString,
                  style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
              )
          ),
          Row(
            children: [
              customBtn('9',Colors.black,Colors.white),
              customBtn('8',Colors.black,Colors.white),
              customBtn('7',Colors.black,Colors.white),
              customBtn('+',Colors.amber , Colors.black),
            ],
          ),
          Row(
            children: [
              customBtn('6',Colors.black,Colors.white),
              customBtn('5',Colors.black,Colors.white),
              customBtn('4',Colors.black,Colors.white),
              customBtn('-',Colors.amber , Colors.black),
            ],
          ),
          Row(
            children: [
              customBtn('3',Colors.black,Colors.white),
              customBtn('2',Colors.black,Colors.white),
              customBtn('1',Colors.black,Colors.white),
              customBtn('*',Colors.amber , Colors.black),
            ],
          ),
          Row(
            children: [
              customBtn('C',Colors.black,Colors.white),
              customBtn('0',Colors.black,Colors.white),
              customBtn('=',Colors.black,Colors.white),
              customBtn('/',Colors.amber , Colors.black),
            ],
          ),
        ],
      )
    );
  }
}

