  import 'package:dars_19_home/pages/show_list_products.dart';
import 'package:dars_19_home/pages/show_plitka_products.dart';
import 'package:dars_19_home/pages/showgaleriaproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchText = TextEditingController();
  bool galeria = true;
  bool royxat = false;
  bool plitka = false;
  bool isSort = true;
  String sortName = 'galeria';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          controller: searchText,
          decoration: InputDecoration(
              hintText: 'Gadjetlar qidirish',
              border: OutlineInputBorder(),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Icon(Icons.search),
              )),
        ),
        actions: [
          IconButton(onPressed: (){
            isSort = !isSort;
            setState(() {});
          }, icon: Image.asset('assets/imgs/up-down.png',width: 20,)),

          departments(),
          
        ],
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            galeria ? Padding(padding: EdgeInsets.all(20),
            child: ProductsShowGaleria(isSort: isSort,search: searchText.text,),) : SizedBox(),

            royxat ? Padding(padding: EdgeInsets.all(20),
              child: ShowListProducts(isSort,searchText.text),) : SizedBox(),

            plitka ?
            Padding(padding: EdgeInsets.all(20),
              child:
              PliticShowProducts(isSort: isSort,search: searchText.text,)) : SizedBox(),


          ],
        ),
      ),
    );
  }

  Widget departments(){
    return PopupMenuButton(
        icon: Icon(Icons.menu),
        itemBuilder: (ctx) {
          return [
            PopupMenuItem(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Galeriya',style: TextStyle(fontWeight: galeria ? FontWeight.bold: FontWeight.w400),),

                SizedBox(width: 40,),

                galeria ? Icon(Icons.check,color: Colors.green,) : SizedBox(),
              ],
            ),onTap: (){
              galeria = true;
              royxat = false;
              plitka = false;
              sortName = 'galeria';
              setState(() {});
            },),

            PopupMenuItem(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Royxat',style: TextStyle(fontWeight: royxat ? FontWeight.bold: FontWeight.w400),),

                SizedBox(width: 40,),

                royxat ? Icon(Icons.check,color: Colors.green,) : SizedBox(),
              ],
            ),onTap: (){
              sortName = 'royxat';
              galeria = false;
              royxat = true;
              plitka = false;
              setState(() {});
            },),

            PopupMenuItem(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Plitka',style: TextStyle(fontWeight: plitka ? FontWeight.bold: FontWeight.w400),),

                SizedBox(width: 40,),

                plitka ? Icon(Icons.check,color: Colors.green,) : SizedBox(),
              ],
            ),onTap: (){
              sortName = 'plitka';
              galeria = false;
              royxat = false;
              plitka = true;
              setState(() {});
            },),
          ];
        });
  }
}
