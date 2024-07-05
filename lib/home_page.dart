import "dart:async";

import "package:flutter/material.dart";
import "package:my_first_app/card.dart";



// class HomePage extends StatelessWidget {
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text(  
//             "Button",
//           ),
//           onPressed: () {},
//         ),
        
//      ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
   
  
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  
  final List<String> _cardList = ["A","J","Q","K"];

  int _timer = 1000;
  
  List<String> _showCardList = [];

  Timer? _timerController;
  
  @override
  void initState(){
    super.initState();
    _cardList.shuffle();

    _timerController = Timer.periodic(Duration(milliseconds: 10),(timer){
      if(_timer > 0)
      setState(() {
        _timer = _timer -1;
      });
    });
  }
  void onClickCard(String title){
    if("A" == title){
      _timerController?.cancel();
    }
    setState(() {
      _showCardList.add(title);    
    });
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * _timer / 1000,
              color: Colors.amber,
            ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Хугацаа : $_timer"),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  _cardList[0],
                  onTap: onClickCard,
                  active: _showCardList.contains(_cardList[0]),     
                ),
                SizedBox(
                  width: 50,
                ),
                MyCard(
                  _cardList[1],
                  onTap: onClickCard,
                  active: _showCardList.contains(_cardList[1]),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  _cardList[2],
                  onTap: onClickCard,
                  active: _showCardList.contains(_cardList[2]),
                ),
                SizedBox(
                  width: 50,
                ),
                MyCard(
                  _cardList[3],
                  onTap: onClickCard,
                  active: _showCardList.contains(_cardList[3]),
                ),
              ],
            ),
          ],
        ),
        ],
      ),
    );
  }
}