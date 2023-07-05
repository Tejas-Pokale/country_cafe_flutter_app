import 'package:country_cafe/widgets/DemoPage.dart';
import 'package:country_cafe/widgets/like_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:country_cafe/widgets/AppIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'data/Cocktail_data.dart';
import 'package:expandable_text/expandable_text.dart';

class MySliverBar extends StatefulWidget {
  const MySliverBar({super.key});

  @override
  State<MySliverBar> createState() => _MySliverBarState();
}

class _MySliverBarState extends State<MySliverBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: size.height * 0.3,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppIcon(
                            icon: Icons.arrow_back_ios,
                            callback: () {},
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                'Nimbu Pani',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: LikeWidget(color: true))
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/images/special/seasonal/nimbupani.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      centerTitle: true,
                    ),
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          text: 'Details',
                        ),
                        Tab(
                          text: 'Ingredients',
                        ),
                        Tab(
                          text: 'Reviews',
                        ),
                      ],
                      indicatorColor: Colors.brown,
                      indicatorWeight: 6,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 5,
                            ),
                          ]),
                      unselectedLabelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 5,
                            ),
                          ]),
                      labelColor: Colors.white,
                    ),
                    pinned: true,
                    backgroundColor: Colors.black,
                  )
                ];
              },
              body: TabBarView(children: [
                GenerateDetails(),
                DemoPage('Ingredients'),
                DemoPage('Reviews'),
              ]))),
      bottomNavigationBar: ItemCountBar(),
    );
  }
}

//Text('Exposing a new object instance Providers allow you to not only expose a value, but also create, listen, and dispose of it. To expose a newly created object, use the default constructor of a provider.Do not use the .value constructor if you want to createan object, or youmay otherwise have undesired side effects. See this StackO… Reusing an existing object instance: If you already have an object instance and want to expose it, it would be best to use the .valueconstructor of a provider. Failing to do so may call your object disposemethod when it is still in use. 1. DO use ChangeNotifierProvider.value to provide an existingChangeNotifier'),

class ItemCountBar extends StatefulWidget {
  const ItemCountBar({super.key});

  @override
  State<ItemCountBar> createState() => _ItemCountBarState();
}

class _ItemCountBarState extends State<ItemCountBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.10,
      width: size.width,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.30),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon(
            icon: FontAwesomeIcons.minus,
            callback: () {},
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 30,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.59),
                borderRadius: BorderRadius.circular(15)),
            child: Center(child: Text('1')),
          ),
          AppIcon(
            icon: FontAwesomeIcons.add,
            callback: () {},
            color: Colors.green,
          ),
          Container(
            height: size.height * 0.10,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            // color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price = \$',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 30,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(child: Text('Buy now')),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.infoCircle,
                size: 20,
                color: Colors.black.withOpacity(0.7),
              ))
        ],
      ),
    );
  }
}

class GenerateDetails extends StatelessWidget {
  const GenerateDetails({super.key});

//name provider price deleverycharge ratings discount offers discription{more images}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size ;
     final data = Cocktail_Data.data;
                  final keys = data.keys.toList();
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
          margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            // color: Colors.black26,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Banana Shake',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'from, kings restrarunts near you',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        ' 5.0',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AbsorbPointer(
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 5,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                        itemSize: 20,
                      ),
                    ),
                    Text(
                      'Delevery charges : \$1',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Center(
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.discount_outlined,
                      color: Colors.brown,
                    ),
                    label: Text(
                      'see discount and offers',
                      style: TextStyle(color: Colors.brown),
                    )),
              ),
              Text('more images'),
              Container(
                height: size.height * 0.15,
                width: size.width,
                child: ListView.builder(
                  
                  itemBuilder: (context, index) {
                   
                    return 
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(data[keys[index]]['path']),
                        ),
                      );
                  },
                  itemCount: keys.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10,),
              Text('Description',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
               SizedBox(height: 5,),
              ExpandableText(
                'Nimbu Pani is an Indian lemonade made with freshly squeezed lemon juice, cumin, and salt. This refreshing summer drink can easily be made into a cocktail by adding gin or vodka to your glass Nimbu Pani is an Indian lemonade made with freshly squeezed lemon juice, cumin, and salt. This refreshing summer drink can easily be made into a cocktail by adding gin or vodka to your glass. Nimbu Pani is an Indian lemonade made with freshly squeezed lemon juice, cumin, and salt. This refreshing summer drink can easily be made into a cocktail by adding gin or vodka to your glass. Nimbu Pani is an Indian lemonade made with freshly squeezed lemon juice, cumin, and salt. This refreshing summer drink can easily be made into a cocktail by adding gin or vodka to your glass.',
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 7,
                linkColor: Colors.brown,
                style: TextStyle(fontSize: 15,height: 1.3,),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }
}
