import 'package:fitness/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness/widgets/drawer.dart';
import 'package:fitness/widgets/app_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
 final TextEditingController _weightController = TextEditingController();
  
  double _fitnessResult = 0;
  String _textResult = "";
  String _imagePathResult = "";
  bool _correctInput = false;
  String appBarTitle = "BMI Kalkulátor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarSettings( appBarTitle: appBarTitle),
        backgroundColor: mainHexColor,
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondHexColor),
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
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Súly (kg)",
                        hintStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: colorWhiteOpacity,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(_heightController.text);
                  double w = double.parse(_weightController.text);
                  if(h > 0 && w > 0) {
                  setState(() {
                     _fitnessResult = (w / h / h) * 10000;
                      if(_fitnessResult > 25){
                        _textResult = "Túlsúlyban szenvedsz! Próbálj meg többet mozogni!";
                        _imagePathResult = "assets/fat.gif";
                        _correctInput = true;
                      } else if(_fitnessResult >= 18.5 && _fitnessResult <= 25){
                        _textResult = "Normális a testsúlyod! Így tovább!";
                        _imagePathResult = "assets/healthy.gif";
                        _correctInput = true;
                      }else{
                        _textResult = "Sovány vagy! Próbálj meg többet enni!";
                        _imagePathResult = "assets/skinny.gif";
                        _correctInput = true;
                      }
                  });
                  } else {
                    setState(() {
                      _textResult = "Kérlek valós adatokat írj be!";
                      _correctInput = false;
                  });
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
                        color: colorRed
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              
                Visibility(
                  visible: _correctInput,
                  child: Text(
                    "BMI Index: ${_fitnessResult.toStringAsFixed(2)}",
                    //"BMI Index: Szép napot!",
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
                        color: colorRed
                        ),
                  )),
              
            ],
          ),
        ),
        drawer: const DrawerScreen()
        );

         
  }
}