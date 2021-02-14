import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: Book(),
  ));
}

class MyApp extends StatelessWidget {
  final Book model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Book>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookStore',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[300],
        title: Text('Book Store'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<Book>(
                builder: (context, child, model) {
                  return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(itemList[index].image)),
                      title: Text(itemList[index].title),
                      subtitle: Text('\฿' + itemList[index].price.toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        model.addBook(itemList[index]);
                        print('Add: ' + itemList[index].title);
                        print(model.calculateTotal());
                      });
                });
          }),
    );
  }
}

class Books {
  int price;
  int id;
  String title;
  String image;
  Books(
      {@required this.price,
        @required this.id,
        @required this.title,
        @required this.image});
}

List<Books> itemList = [
  Books(
      id: 1,
      title: 'Book',
      image: 'assets/images/1.jpg',
      price: 90),
  Books(
      id: 2,
      title: 'Book',
      image: 'assets/images/2.jpg',
      price: 299),
  Books(
      id: 3,
      title: 'Book',
      image: 'assets/images/3.jpg',
      price: 300),
  Books(
      id: 4,
      title: 'Book',
      image: 'assets/images/4.jpg',
      price: 90),
  Books(
      id: 5,
      title: 'Book',
      image: 'assets/images/5.jpg',
      price: 300),
  Books(
      id: 6,
      title: 'Book',
      image: 'assets/images/6.jpg',
      price: 300),
  Books(
      id: 7,
      title: 'Book',
      image: 'assets/images/7.jpg',
      price: 500),
  Books(
      id: 8,
      title: 'Book',
      image: 'assets/images/8.jpg',
      price: 99),
  Books(
      id: 9,
      title: 'Book',
      image: 'assets/images/9.jpg',
      price: 299),
  Books(
      id: 10,
      title: 'Book',
      image: 'assets/images/10.jpg',
      price: 599),
];
