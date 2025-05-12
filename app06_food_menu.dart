import 'package:flutter/material.dart';

class MyKitchenApp extends StatefulWidget {
  @override
  _MyKitchenAppState createState() => _MyKitchenAppState();
}

class _MyKitchenAppState extends State<MyKitchenApp> {
  // Define your lists here
  List<String> food = ['Pizza', 'Burger', 'Pasta', 'Salad'];
  List<double> price = [12.99, 8.99, 10.99, 7.99];
  List<String> images = [
    'https://example.com/pizza.jpg',
    'https://example.com/burger.jpg',
    'https://example.com/pasta.jpg',
    'https://example.com/salad.jpg'
  ];

  // Fixed the amount list initialization and finalamount variable
  List<double> amount = [0, 0, 0, 0]; // Initialize with zeros for each food item
  double finalAmount = 0; // Fixed variable name and type

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('My Kitchen')
            ),
            body: ListView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black54),
                          color: Colors.orangeAccent
                      ),
                      child: ListTile(
                        leading: Image.network(images[index]),
                        title: Text('${food[index]}'),
                        subtitle: Text('\$${price[index]}'),
                        trailing: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 50),
                                Text('Qty'),
                                Text('Amount')
                              ],
                            ),
                            Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        // Fixed setState method
                                        setState(() {
                                          amount[index] = amount[index] + price[index];
                                          // Update finalAmount if needed
                                          finalAmount = amount.reduce((a, b) => a + b);
                                        });
                                      },
                                      child: Icon(Icons.add)
                                  ),
                                  Text('${amount[index]}') // Added to display the current amount
                                ]
                            )
                          ],
                        ),
                      )
                  );
                }
            )
        )
    );
  }
}
