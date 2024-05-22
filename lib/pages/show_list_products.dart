import 'package:dars_19_home/pages/products.dart';
import 'package:flutter/material.dart';

class ShowListProducts extends StatefulWidget {
  bool isSort;
  String search;

  ShowListProducts(this.isSort,this.search);

  @override
  State<ShowListProducts> createState() => _ShowListProductsState();
}

class _ShowListProductsState extends State<ShowListProducts> {

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
    return SingleChildScrollView(
      child: Column(
        children: [
            ...List.generate(productsList.length, (index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 202,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i = 0; i < products.length; i++)
                        productsList[index] == products[i].name ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(products[i].img),
                                  fit: BoxFit.fitHeight
                                )
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text('${products[i].name}',style: TextStyle(fontWeight: FontWeight.bold),),
                                      width: 100,),

                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),alignment: Alignment.topRight,)
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                      child: Text(products[i].condition,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                                  ),

                                  SizedBox(height: 10,),

                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: '${products[i].price} som',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black))
                                      ]
                                  )),

                                  Container(
                                    height: 60,
                                    width: 120,
                                    child: Text('${products[i].location}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
                                  )
                                ],
                              ),
                            ),

                          ],
                        ) : SizedBox(),
                    ],
                  ),
                ),
              );
            })
        ],
      ),
    );
  }
}
