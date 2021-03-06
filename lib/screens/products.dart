import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/data/demodata.dart';
import 'package:yousef/models/mainmodel.dart';
import 'package:yousef/screens/itemscreen.dart';
import 'package:yousef/theme/icons.dart';

class CategoryItemPage extends StatefulWidget {
  @override
  _CategoryItemPageState createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      //builder: (context, child, AppController controller) {
        builder: (context,child ,MainModel controller){
          return   Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Category items',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            iconbag(context)
          ],
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:.75
            ),
            scrollDirection: Axis.vertical,
            itemCount: controller.selectedcategory!.Product.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      controller.selectproduct(controller.selectedcategory!.Product[index].id);
                      Navigator.push(context, MaterialPageRoute(builder: (_){return ItemScreen();}));
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 200, width: 200,
                      margin: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: (){},
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(controller.selectedcategory!.Product[index].itemimage))),
                      // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),)
                    ),
                  ),
                 // Text(CategoryData[index]['category name']),
                   Text(controller.selectedcategory!.Product[index].producteName),
                 // Text(CategoryData[index]['items number']),
                  Text(controller.selectedcategory!.Product[index].itemprice)
                ],
              );
            },
          ),
        ),
      );
        },
      
    );
  }
}
