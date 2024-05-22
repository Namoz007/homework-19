import 'package:dars_19_home/pages/products.dart';
import 'package:flutter/material.dart';


class ProductsShowGaleria extends StatefulWidget {
  bool isSort;
  String search;
  ProductsShowGaleria({required this.isSort, required this.search});

  @override
  State<ProductsShowGaleria> createState() => _ProductsShowGaleriaState();
}

class _ProductsShowGaleriaState extends State<ProductsShowGaleria> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i = 0; i < productsList.length; i++)
          for(int j = 0; j < products.length;j++)
            productsList[i] == products[j].name ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  // height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            width: double.infinity,
                            height: 208,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                  image: AssetImage(products[j].img),
                                  fit: BoxFit.contain
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent
                              ),
                              alignment: Alignment.center,
                              child: Text('TOP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            ),
                          )
                      ),

                      Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: Text("This product: ${products[j].name}",style: TextStyle(fontSize: 18),)),

                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
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

                            SizedBox(height: 20,),

                            RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: 'Price:  ',style: TextStyle(fontSize: 17,color: Colors.black)),

                                  TextSpan(text: '${products[j].price} som',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
                                ]
                            )),

                            SizedBox(height: 20,),

                            RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: 'Location:  ',style: TextStyle(fontSize: 17,color: Colors.black)),

                                  TextSpan(text: '${products[j].location}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
                                ]
                            )),
                          ],
                        ),)
                    ],
                  ),
                )) : SizedBox(),

      ],
    );
  }
}
