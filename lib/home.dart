import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Basic'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: SafeArea(
        child: 
      SingleChildScrollView(child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(16),),
            _basicGestures(context),
            Divider(thickness: 2.0),
            draggableWidget(),
            Divider(thickness: 2.0, color: Colors.black),
            _dragTarget(context)
          ],
        ),
      ),
      )
      )
    );
  }

  DragTarget<int> _dragTarget(BuildContext context){
    return DragTarget<int>(
      onAccept: (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Accepted color value: $data')),
        );
      },
      builder: (context, candidateData, rejectedData) => candidateData.isEmpty? Text('Drop here!', style: TextStyle(color: Colors.black)) : Text('Painting Color: ${candidateData.first}', TextStyle(color: Color(candidateData[0]))),
    );
  }

  GestureDetector _basicGestures(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tapped!')),
        );
      },
      onDoubleTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Double Tapped!')),
        );
      },
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Long Pressed!')),
        );
      },
      onPanUpdate: (DragUpdateDetails details) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Panning at: ${details.localPosition}')),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.lightGreenAccent,
        child: const Center(
          child: Text(
            'Tap, Double Tap, or Long Press',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Draggable<int> draggableWidget() {
    return Draggable<int>(
      data: int.parse(Colors.tealAccent.value.toString()),
      feedback: Icon(Icons.palette, size: 50, color: Colors.tealAccent),
      childWhenDragging: Icon(Icons.palette, size: 50, color: Colors.grey),
      child: Column(
        children: [
          Icon(Icons.palette, size: 50, color: Colors.tealAccent),
          Text('Drag Me'),
        ],
      )
    );
  }
}

