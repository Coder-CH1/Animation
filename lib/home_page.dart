import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInFadeOutList(),
    );
  }
}

class FadeInFadeOutList extends StatefulWidget {
  const FadeInFadeOutList({Key? key}) : super(key: key);

  @override
  State<FadeInFadeOutList> createState() => _FadeInFadeOutListState();
}

class _FadeInFadeOutListState extends State<FadeInFadeOutList> {
  final ScrollController _scrollController = ScrollController();
  List<Color> _colors = [Colors.green, Colors.redAccent, Colors.pink, Colors.blueAccent, Colors.deepOrange];
  int _colorIndex = 0;
  List<bool> _isSelected = List.filled(36, false);
  final List<String> _states = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kastina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Osun',
    'Oyo',
    'Plateau',
    'Rivers',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara'
  ];
  @override

  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
       onNotification: (ScrollNotification notification) {
         if (notification is ScrollUpdateNotification) {
           if (notification.scrollDelta! > 0) {
             setState(() {
              _colorIndex = (_colorIndex + 1) % _colors.length;
             });
           } else {
             setState(() {
              _colorIndex = (_colorIndex - 1 + _colors.length) % _colors.length;
             });
           }
         }
         return true;
       },
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _states.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: () {
                  setState(() {
                    _isSelected[index] = !_isSelected[index];
                    _colors[index] = _isSelected[index] ? Colors.indigo : Colors.purple;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: _isSelected[index] ? Colors.black54 : Colors.brown,
                    child: ListTile(
                      title: Text(_states[index], style: TextStyle(
                        fontSize: 20,
                        color: _colors[_colorIndex]
                      )),
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}



// class FadeInFadeOutListItem extends StatelessWidget {
//   final double opacity;
//   final Widget child;
//   const FadeInFadeOutListItem({required this.opacity, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//         opacity: opacity.clamp(0, 1),
//         duration: Duration(milliseconds: 500),
//       child: child,
//     );
//   }
// }