
import 'package:flutter/material.dart';
import 'package:moor_test1/app_database.dart';
import 'package:provider/provider.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moor db test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Product Name'),
              keyboardType: TextInputType.text,
              controller: productNameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Product Price'),
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  Provider.of<AppDatabase>(context,listen: false).orderDao.insertNewOrder(
                      Order(
                          price: priceController.text,
                          productName: productNameController.text
                      )
                  );
                  priceController.clear();
                  productNameController.clear();
                 /* AppDatabase().orderDao.insertNewOrder(Order(
                      price: priceController.text,
                      productName: productNameController.text
                  ));*/
                });
              },
              color: Colors.green,
              child: Text("Place Order"),
            ),
            Container(
              height: 700,
              width: double.infinity,
              child: StreamBuilder(
                stream: Provider.of<AppDatabase>(context).orderDao.watchAllOrder(),
                builder: (context, AsyncSnapshot<List<Order>> snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return Card(
                          color: Colors.orangeAccent,
                          child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1}'),
                                radius: 20,
                              ),
                              title: Text(snapshot.data[index].productName),
                              subtitle: Text("Rs. ${snapshot.data[index].price}"),
                              trailing: IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {
                                  setState(() {
                                    Provider.of<AppDatabase>(context,listen: false).orderDao.deleteOrder(snapshot.data[index]);
                                  });
                                },
                                color: Colors.red,
                              )),
                        );
                      },
                      itemCount: snapshot.data.length,
                    );
                  }else{
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
