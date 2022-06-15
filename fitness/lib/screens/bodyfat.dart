import 'package:fitness/constants/app_constants.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BodyFat extends StatefulWidget {
  const BodyFat({Key? key}) : super(key: key);

  @override
  BodyFatState createState() => BodyFatState();
}

class BodyFatState extends State<BodyFat> {
final TextEditingController _heightController = TextEditingController();
final TextEditingController _neckController = TextEditingController();
final TextEditingController _waistController = TextEditingController();
  
  double _fitnessResult = 0;
  String _textResult = "";
  String _imagePathResult = "";
  bool _correctInput = false;
  int selectedValue = 1;


  String appBarTitle = "Testzsírszázalék Becslő";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarSettings(appBarTitle: appBarTitle),
      backgroundColor: mainHexColor,
       body: 
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [       
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondHexColor
                          ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Magasság (cm)",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: colorWhiteOpacity
                            ),
                      ),
                    ),
                  ),
                 
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _neckController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondHexColor
                          ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nyak (cm)",
                        hintStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: colorWhiteOpacity),
                      ),
                    ),
                  ),
                
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _waistController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Derékbőség (cm)",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: colorWhiteOpacity
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              
                Row(children: [
                    Container(
                      padding: const EdgeInsets.all(32),
                      child:  const Flexible( 
                      child: Text("Nem:", 
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      ),
                 
                    
                ),
                  Flexible( 
                    child:RadioListTile(
                      value: 1,
                      groupValue: selectedValue,
                        title: const Text(
                          "Férfi", 
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                        ),
                        onChanged: (value) => setState(() {
                          selectedValue = 1;
                        })
                        )),
                 Flexible( 
                    child:RadioListTile(
                    value: 2,
                    groupValue: selectedValue,
                    title: const Text(
                      "Nő", 
                    style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                 )
                 ),
                 onChanged: (value) => setState(() {
                   selectedValue = 2;
                 })
                  )),
                ],),
                 
                
              GestureDetector(
                onTap: () {
                    double h = double.parse(_heightController.text);
                    double n = double.parse(_neckController.text);
                    double w = double.parse(_waistController.text);
                    double toSubtract;
                    String gender;

                  if(h > 0 && w > 0 && n > 0) {
                    if(selectedValue == 1) {
                      toSubtract = 10.1;
                      gender = "Male";
                    } else {
                      toSubtract = 19.2;
                      gender = "Female";
                    }
                  setState(() {
                    _fitnessResult = toSubtract - 0.239 * h + 0.8 * w - 0.5 * n;
                    if(gender == "Female") {
                      if(_fitnessResult < 10){
                        _textResult = "A testzsírszázalékod alacsony!";
                        _imagePathResult = "assets/skinny.gif";
                        _correctInput = true;
                      } else if(_fitnessResult >= 10 && _fitnessResult <= 31){
                        _textResult = "A testzsírszázalékod optimális!";
                        _imagePathResult = "assets/healthy.gif";
                        _correctInput = true;
                      }else{
                        _textResult = "A testzsírszázalékod túl magas!";
                        
                        _imagePathResult = "assets/fat.gif";
                        _correctInput = true;
                      }
                  } else {
                    if(_fitnessResult < 2){
                      _textResult = "A testzsírszázalékod alacsony!";
                      _imagePathResult = "assets/skinny.gif";
                      _correctInput = true;
                    } else if(_fitnessResult >= 2 && _fitnessResult <= 24){
                      _textResult = "A testzsírszázalékod optimális!";
                      _imagePathResult = "assets/healthy.gif";
                      _correctInput = true;
                    }else{
                      _textResult = "A testzsírszázalékod túl magas!";
                      
                      _imagePathResult = "assets/fat.gif";
                      _correctInput = true;
                    }
                  }});
                  } else {
                    setState(() {
                      _textResult = "Kérlek valós adatokat írj be!";
                      _correctInput = false;
                  }
                   );
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                    border: Border.all(color: colorLightGrey, width: 2.5),
                    borderRadius: BorderRadius.circular(80)
                  ),
                  child: Text(
                    "Kiszámít",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colorRed),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                Visibility(
                    visible: _correctInput,
                    child: Text(
                      "Becsült Testzsírszázalék: ${_fitnessResult.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 45, color: secondHexColor),
                  )),
               const SizedBox(
                height: 10,
              ),
            Visibility(
                  visible: _correctInput,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                    ),
                      borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                child: Image(
                  width: 180,
                  height: 180,
                  image: AssetImage(_imagePathResult),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.red[400]),
                  )),
            ],
          ),
        ),
    );
  }
}