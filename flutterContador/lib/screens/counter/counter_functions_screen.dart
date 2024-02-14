import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget{
  const CounterFunctionsScreen({super.key});

  @override
  State<StatefulWidget> createState()=>_CounterFunctionsScreenState();
}
class _CounterFunctionsScreenState extends State<CounterFunctionsScreen>{
  int clickCounter=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              clickCounter=0;
            });
          },
            icon: Icon(Icons.refresh_rounded),),
        ],
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',style: TextStyle(fontSize: 160,fontWeight: FontWeight.w100),),
              Text(clickCounter<=1?'Click!!':'Clicks!!',style: TextStyle(fontSize: 25),)
            ],
          )
      ),
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(icon: Icons.refresh_rounded,onPressed:(){setState(() {
            clickCounter=0;
          });}) ,
          SizedBox(height: 20,),
          CustomButton(icon: Icons.plus_one,onPressed: (){
            setState(() {
              clickCounter++;
            });
          },),
          SizedBox(height: 20,),
          CustomButton(icon: Icons.exposure_minus_1_outlined,onPressed: (){
            setState(() {
              if(clickCounter==0) return;
              clickCounter--;
            });
          },)
        ],
      )
    );
  }

}

class CustomButton extends StatelessWidget{
  final IconData icon;
  final VoidCallback? onPressed;
  
  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed,
    shape: const StadiumBorder(),
    elevation: 5,
    enableFeedback: true,
    backgroundColor: Colors.yellow,
    child: Icon(icon));
  }}