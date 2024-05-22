import 'package:dars_19_home/pages/products.dart';
import 'package:flutter/material.dart';

class PliticShowProducts extends StatefulWidget {
  bool isSort;
  String search;


  PliticShowProducts({required this.isSort,required this.search});

  @override
  State<PliticShowProducts> createState() => _PliticShowProductsState();
}

class _PliticShowProductsState extends State<PliticShowProducts> {
  @override
  Widget build(BuildContext context) {
    List<String> productsList = [];
    if(widget.search == ''){
      productsList = [];
      for(int i = 0; i < products.length;i++){
        productsList.add(products[i].name);
      }
    }else {
      productsList = [];
      ProductsController productsController = ProductsController();
      // productsController.lists(widget.search);
      productsList = [...productsController.lists(widget.search)];
    }
    return GridView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return GridTile(
              child: cards(index,productsList)
          );
        });
  }

  Widget cards(int index, List lst){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i = 0; i < products.length;i++)
            lst[index] == products[i].name ?
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 height: 150,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage(products[i].img),
                       fit: BoxFit.fitHeight
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(left: 4,right: 4),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('${products[i].name}',style: TextStyle(fontWeight: FontWeight.bold),),

                     IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                   ],
                 ),
               ),

               SizedBox(height: 5,),

               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Container(
                   color: Colors.grey.shade400,
                   child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                     child: Text(products[i].condition,style: TextStyle(fontWeight: FontWeight.bold),),),
                 ),
               ),

               SizedBox(height: 10,),

               Padding(padding: EdgeInsets.only(left: 5),
                 child: Text('${products[i].price} sum',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),),

               Padding(padding: EdgeInsets.only(left: 5),
                 child: Text('${products[i].location}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)
             ],
           ) : SizedBox(),

        ],
      ),
    );
  }
}