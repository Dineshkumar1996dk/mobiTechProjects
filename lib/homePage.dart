import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:mwsproducts/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeProvider;
  @override
  void initState() {
    // TODO: implement initState
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getApiData(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    super.initState();
  }

  Widget listItems(context, Map items) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.network(
                  items['image_link'],
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  // height: 100,
                  fit: BoxFit.fill,
                ),
              ),

              //Product name
              Text(
                items['brand'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                items['name'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              //Description

              ExpandableText(
                items['description'],
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 2,
                linkColor: Colors.blue,
              ),

              // Text(
              //   items['description'],
              //   textAlign: TextAlign.start,
              //   style: const TextStyle(
              //       fontSize: 18,
              //       color: Colors.black,
              //       fontStyle: FontStyle.normal,
              //       fontWeight: FontWeight.normal),
              // ),
              //Price
              Text(
                items['price'].toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              //Ratings
              Text(
                items['rating'].toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: true);
    return ListView.builder(
        itemCount: homeProvider.productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return listItems(context, homeProvider.productsList[index]);
        });
  }
}
