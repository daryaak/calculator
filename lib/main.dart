import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  var userInput = '';
  var calcResult = '0';

  var blackButton = const Color.fromARGB(255, 52, 52, 52);
  var redButton = const Color.fromARGB(255, 255, 89, 89);
  var greenButton = const Color.fromARGB(255, 102, 255, 127);
  var whiteButton = const Color.fromARGB(255, 255, 255, 255);

  final List<String> operations =['+','-','x','%','÷','.'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 48,
                  fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  calcResult,
                  style: const TextStyle(
                  color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 48,
                  fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),

          ),
          Expanded(
            flex:3,
              child: Column(
                children: [
                  const SizedBox(height: 19),
                  Flexible(
                    child: Row(
                      children: [
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        redButton, 
                        blackButton, 
                        'C', 
                        (){
                          setState(() {
                          userInput = '';
                          calcResult = '0';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '+/-', 
                        (){
                          setState(() {
                            userInput = '-($userInput)';
                            getResult();
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        greenButton, 
                        '%', 
                        (){
                          setState(() {
                            if(userInput != ''){
                              if(checkOperator()){
                              getResult();
                              } 
                              if(!checkOperator()){
                                userInput = '${userInput.substring(0, userInput.length - 1)}%';
                              }else{
                                  userInput += '%';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        greenButton, 
                        '÷', 
                        (){
                          setState(() {
                            if(userInput != ''){
                              if(checkOperator()){
                              getResult();
                              }
                              if(!checkOperator()){
                                userInput = '${userInput.substring(0, userInput.length - 1)}x';
                              }else{
                                  userInput += '÷';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      ]
                    ),
                  ),
                  const SizedBox(height: 19),
                  Flexible(
                    child: Row(
                      children: [
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '7', 
                        (){
                          setState(() {
                            userInput += '7';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '8', 
                        (){
                          setState(() {
                            userInput += '8';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '9', 
                        (){
                          setState(() {
                            userInput += '9';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        greenButton, 
                        'x', 
                        (){
                           setState(() {
                            if(userInput != ''){
                              if(checkOperator()){
                              getResult();
                              }
                              if(!checkOperator()){
                                userInput = '${userInput.substring(0, userInput.length - 1)}x';
                              }else{
                                  userInput += 'x';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      ]
                    ),
                  ),
                  const SizedBox(height: 19),
                  Flexible(
                    child: Row(
                      children: [
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '4', 
                        (){
                          setState(() {
                            userInput += '4';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '5', 
                        (){
                          setState(() {
                            userInput += '5';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '6', 
                        (){
                          setState(() {
                            userInput += '6';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        greenButton, 
                        '-', 
                        (){
                           setState(() {
                            if(userInput != ''){
                              if(checkOperator()){
                              getResult();
                              }
                              if(!checkOperator()){
                                userInput = '${userInput.substring(0, userInput.length - 1)}-';
                              }else{
                                  userInput += '-';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      ]
                    ),
                  ),
                  const SizedBox(height: 19),
                  Flexible(
                    child: Row(
                      children: [
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '1', 
                        (){
                          setState(() {
                            userInput += '1';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '2', 
                        (){
                          setState(() {
                            userInput += '2';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '3', 
                        (){
                          setState(() {
                            userInput += '3';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        greenButton, 
                        '+', 
                        (){
                           setState(() {
                            if(userInput != ''){
                              if(checkOperator()){
                              getResult();
                              }
                              if(!checkOperator()){
                                userInput = '${userInput.substring(0, userInput.length - 1)}+';
                              }else{
                                  userInput += '+';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      ]
                    ),
                  ),
                  const SizedBox(height: 19),
                  Flexible(
                    child: Row(
                      children: [
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '0', 
                        (){
                           setState(() {
                            userInput += '0';
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: CalcButton(
                        blackButton, 
                        whiteButton, 
                        '.', 
                        (){
                           setState(() {
                            if(userInput != ''){
                              if(checkOperator()&& !userInput.endsWith(')')){
                                userInput += '.';
                              }
                            }
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        flex: 2,
                        child: CalcButton(
                        greenButton, 
                        blackButton, 
                        '=', 
                        (){
                          setState(() {
                            if(!checkOperator()){
                              userInput = userInput.substring(0,userInput.length-1);
                            }
                            getResult();
                          });
                        }),
                      ),
                      const SizedBox(width: 19),
                      ]
                    ),
                  ),
                  const SizedBox(height: 19),
                ],
              )
          )  
        ],
      ));   
  }

  bool checkOperator(){
    for (String operation in operations){
      if(userInput.endsWith(operation)){
        return false;
      }
    }
      return true;
  }

  void getResult() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');

    calcResult = finaluserinput.interpret().toString();
  }

}

class CalcButton extends StatelessWidget{

  final Color color;
  final Color textColor;
  final String buttonText;
  final VoidCallback buttonTapped;
  
  const CalcButton(this.color,this.textColor,this.buttonText,this.buttonTapped);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: buttonTapped,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Inter',
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
