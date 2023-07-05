import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:focused_menu/modals.dart';
import 'package:country_cafe/splash_screen.dart';
import 'package:country_cafe/trans_appbar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'data/ForYou_data.dart';
import 'widgets/like_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:focused_menu/focused_menu.dart';
import 'data/Seasonal_Data.dart';
import 'data/slider_data.dart';

class AppBarEg extends StatefulWidget {
  const AppBarEg({super.key});

  @override
  State<AppBarEg> createState() => _AppBarEgState();
}

class _AppBarEgState extends State<AppBarEg> {
  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.brown.shade200, // Replace with the desired color
    // ));

    //return scaffold
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('Country Cafe`'),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: badges.Badge(
                            badgeContent: const Text(
                              '7',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            child: const Icon(Icons.notifications),
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: Colors.brown.shade200,
                              elevation: 3,
                              padding: const EdgeInsets.all(5),
                              // borderRadius: BorderRadius.circular(4),
                              // borderSide: BorderSide(color: Colors.white, width: 2),
                              // borderGradient: badges.BadgeGradient.linear(
                              //     colors: [Colors.red, Colors.black]),
                              // badgeGradient: badges.BadgeGradient.linear(
                              //   colors: [Colors.blue, Colors.yellow],
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              // ),
                            ))),
                    IconButton(
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: MyCustomSearchDelegate());
                        },
                        icon: const Icon(Icons.search)),
                  ],
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.brown.shade500,
                        Colors.white,

                        // Colors.white,
                      ],
                    )),
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.home),
                        text: 'home',
                      ),
                      Tab(
                        icon: Icon(Icons.local_offer_sharp),
                        text: 'offers',
                      ),
                      Tab(
                        icon: Icon(Icons.favorite_outlined),
                        text: 'favorites',
                      ),
                      Tab(
                        icon: Icon(Icons.shopping_bag),
                        text: 'my orders',
                      ),
                    ],
                    indicatorColor: Colors.white,
                    indicatorWeight: 3,
                    isScrollable: true,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                  ),
                  // pinned: true,
                  elevation: 10,
                  floating: true,
                  // snap: true,
                  pinned: true,
                  forceElevated: true,
                )
              ];
            },
            body: TabBarView(children: [
              MyBottomNav(),
              DemoPage('Offers'),
              DemoPage('Favourites'),
              DemoPage('Orders'),
            ]),
          ),
        ),
        // body: TabBarView(children: [
        //   MyBottomNav(),
        //   DemoPage('Cafe`'),
        //   DemoPage('Notifications'),
        //   DemoPage('MyVallet'),
        // ]),
        drawer: NavigationDrawer(context),
      ),
    );
  }
}

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight + 20);
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Country Cafe`'),
      //centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: badges.Badge(
                badgeContent: const Text(
                  '7',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: const Icon(Icons.notifications),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.brown.shade200,
                  elevation: 3,
                  padding: const EdgeInsets.all(5),
                  // borderRadius: BorderRadius.circular(4),
                  // borderSide: BorderSide(color: Colors.white, width: 2),
                  // borderGradient: badges.BadgeGradient.linear(
                  //     colors: [Colors.red, Colors.black]),
                  // badgeGradient: badges.BadgeGradient.linear(
                  //   colors: [Colors.blue, Colors.yellow],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // ),
                ))),
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MyCustomSearchDelegate());
            },
            icon: const Icon(Icons.search)),
      ],
      //backgroundColor: Colors.redAccent,
      elevation: 10,
      //titleSpacing: 10,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.brown.shade500,
            Colors.white,

            // Colors.white,
          ],
        )),
      ),
      bottom: const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: 'home',
          ),
          Tab(
            icon: Icon(Icons.coffee_rounded),
            text: 'cafe`',
          ),
          Tab(
            icon: Icon(Icons.favorite_outlined),
            text: 'favorites',
          ),
          Tab(
            icon: Icon(Icons.attach_money),
            text: 'my vallet',
          ),
        ],
        indicatorColor: Colors.white,
        indicatorWeight: 3,
      ),
    );
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}

class DemoPage extends StatelessWidget {
  String? data;

  DemoPage(String? data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data!,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  BuildContext? context;

  NavigationDrawer(BuildContext? context) {
    this.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [buildHeader(), buildMenuItems()],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context!).padding.top + 5, bottom: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.brown.shade500,
        Colors.white,
      ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
              radius: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tejas Pokale',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'tejaspokale9204@gmail.com',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context!).push(MaterialPageRoute(
                builder: (context) => const TransApp(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_outlined),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.of(context!).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Achieves'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Updates'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text('Notifications'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MyCustomSearchDelegate extends SearchDelegate {
  final suggestList = [
    'coffee',
    'cold coffee',
    'hot coffee',
    'tea',
    'lemon tea',
    'black tea',
    'hot chocolate',
    'startbucks'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = [];

    for (var q in suggestList) {
      if (q.startsWith(query.toLowerCase())) {
        suggest.add(q);
      }
    }

    for (var q in suggestList) {
      if (q.contains(query.toLowerCase()) && !suggest.contains(q)) {
        suggest.add(q);
      }
    }

    //suggest.sort();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggest[index]),
          onTap: () {
            query = suggest[index];
            showResults(context);
          },
        );
      },
      itemCount: suggest.length,
    );
  }
}

class MyBottomNav extends StatefulWidget {
  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  final _body = [
    MyForYou(),
    const MySpecialOnce(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.brown.shade100,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          elevation: 50,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.recommend),
              label: 'For You',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces_outlined),
              label: 'Special ones',
            ),
          ]),
    );
  }
}

class MyForYou extends StatefulWidget {
  @override
  State<MyForYou> createState() => _MyForYouState();
}

class _MyForYouState extends State<MyForYou>
    with SingleTickerProviderStateMixin {
  //variables
  final _isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Scaffold(
        // extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyForYouRecentItems(),
              MyForYouMostOrderedItems(),
              MyForYouItems(),
            ],
          ),
        ),
        floatingActionButton: _isVisible ? MyFAB() : null,
      ),
    );
  }
}

class MyFAB extends StatefulWidget {
  @override
  State<MyFAB> createState() => _MyFABState();
}

class _MyFABState extends State<MyFAB> with SingleTickerProviderStateMixin {
  //variables
  late Animation<double> _animation;
  late AnimationController _animationController;
  var _fabIcon = Icons.add;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Add to favourites",
              iconColor: Colors.brown,
              bubbleColor: Colors.brown.shade100,
              icon: Icons.add,
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                reverseAnimation();
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Add to share",
              iconColor: Colors.brown,
              bubbleColor: Colors.brown.shade100,
              icon: Icons.add,
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                reverseAnimation();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Recommend friends",
              iconColor: Colors.brown,
              bubbleColor: Colors.brown.shade100,
              icon: Icons.add,
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                reverseAnimation();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          //   // On pressed change animation state
          onPress: () {
            _animationController.isCompleted
                ? reverseAnimation()
                : forwardAnimation();
            setState(() {});
          },

          // Floating Action button Icon color
          iconColor: Colors.white,

          // Flaoting Action button Icon
          iconData: _fabIcon,
          backGroundColor: Colors.black,
        ),
      ),
    );
  }

  //funtions
  void reverseAnimation() {
    _animationController.reverse();
    setState(() {
      _fabIcon = Icons.add;
    });
  }

  void forwardAnimation() {
    _animationController.forward();
    setState(() {
      _fabIcon = Icons.close;
    });
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyForYouRecentItems extends StatelessWidget {
  final _data = ForYou_data.data;

  @override
  Widget build(BuildContext context) {
    dynamic recent = _data['Categories']!['Recent Search']!;
    dynamic recentKeys = recent.keys.toList();
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Recent Search',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: size.height * 0.2,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10.0).copyWith(left: 0),
                  height: size.height * 0.2,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.brown.shade400,
                      spreadRadius: 2,
                    )
                  ], borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.6,
                    child: Stack(
                      children: [
                        Image.asset(
                          recent[recentKeys[index]]!['path']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: LikeWidget(
                              color: recent[recentKeys[index]]!['favourite']!,
                            ),
                          ),
                          right: 0,
                          top: 0,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            // width: double.infinity,
                            padding: const EdgeInsets.all(5.0),

                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0)),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text(
                                recentKeys[index],
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                );
              },
              itemCount: recent.length,
            ),
          )
        ],
      ),
    );
  }
}

class MyForYouMostOrderedItems extends StatelessWidget {
  final _data = ForYou_data.data;

  MyForYouMostOrderedItems({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic mostOrder = _data['Categories']!['Most Ordered Today']!;
    dynamic orderKeys = mostOrder.keys.toList();
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.28,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'Previously ordered',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: size.height * 0.24,
            width: size.width,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 5),
              itemBuilder: (context, index) {
                return Container(
                  height: size.height * 0.24,
                  width: size.width * 0.6,
                  margin: const EdgeInsets.all(10.0).copyWith(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.15,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.brown.shade400,
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0))),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              mostOrder[orderKeys[index]]!['path']!,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: LikeWidget(
                                  color: mostOrder[orderKeys[index]]![
                                      'favourite']!,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                // width: double.infinity,
                                padding: const EdgeInsets.all(5.0),

                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10.0)),
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                child: Center(
                                  child: Text(
                                    orderKeys[index],
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.05,
                        width: size.width * 0.6,
                        // padding: EdgeInsets.all(4.0),
                        // margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.brown.shade400,
                              spreadRadius: 2,
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up,
                                      color: Colors.blue),
                                  label: Text(
                                    mostOrder[orderKeys[index]]['likes']
                                        .toString(),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.star_border_purple500_rounded,
                                      color: Colors.orangeAccent),
                                  label: Text(mostOrder[orderKeys[index]]
                                          ['rating']
                                      .toString())),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_money,
                                    color: Colors.green),
                                label: Text(
                                  '${mostOrder[orderKeys[index]]['price'].toString()}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: mostOrder.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class MyForYouItems extends StatelessWidget {
  final _data = ForYou_data.data;

  @override
  Widget build(BuildContext context) {
    dynamic recData = _data['Categories']!['ForYou']!;
    dynamic recKeys = recData.keys.toList();
    var size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'From near restraunts',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            width: size.width * 0.95,
            // height: size.height,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var _pageController = PageController();
                return Container(
                  width: size.width * 0.95,
                  height: size.height * 0.42,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  recData[recKeys[index]]['images'][0]),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 2,
                              text: TextSpan(
                                text: '${recKeys[index]}\n',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'from, ${recData[recKeys[index]]['res_name']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FocusedMenuHolder(
                              blurSize: 5.0,
                              menuItemExtent: 45,
                              menuBoxDecoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              duration: const Duration(milliseconds: 100),
                              animateMenuItems: true,
                              blurBackgroundColor: Colors.black54,
                              bottomOffsetHeight: 100,
                              openWithTap: true,
                              menuItems: <FocusedMenuItem>[
                                FocusedMenuItem(
                                    title: const Text("Share"),
                                    trailingIcon: const Icon(Icons.share),
                                    onPressed: () {}),
                                FocusedMenuItem(
                                    title: const Text("Favorite"),
                                    trailingIcon:
                                        const Icon(Icons.favorite_border),
                                    onPressed: () {}),
                                FocusedMenuItem(
                                    title: const Text("Don't recomment this"),
                                    trailingIcon:
                                        const Icon(Icons.do_not_disturb),
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTwo()));
                                    }),
                                FocusedMenuItem(
                                    title: const Text(
                                      "Report",
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                    trailingIcon: const Icon(
                                      Icons.do_not_disturb,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {}),
                              ],
                              onPressed: () {},
                              child: const Icon(
                                // onPressed: () {},
                                // icon: Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: size.height * 0.25,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.brown.shade400,
                                spreadRadius: 3,
                              ),
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          PageView.builder(
                            controller: _pageController,
                            itemBuilder: (context, index2) {
                              return Image.asset(
                                recData[recKeys[index]]['images'][index2],
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                            itemCount: recData[recKeys[index]]['images'].length,
                            scrollDirection: Axis.horizontal,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmoothPageIndicator(
                              controller: _pageController, // PageController
                              count: 4,
                              // forcing the indicator to use a specific direction
                              textDirection: TextDirection.ltr,
                              effect: const WormEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: Colors.red,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up,
                                      color: Colors.blue),
                                  label: Text(
                                    recData[recKeys[index]]['likes'].toString(),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.star_border_purple500_rounded,
                                      color: Colors.orangeAccent),
                                  label: Text(recData[recKeys[index]]['rating']
                                      .toString())),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_money,
                                    color: Colors.green),
                                label: Text(recData[recKeys[index]]['price']
                                    .toString()),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.card_giftcard,
                                    color: Colors.green,
                                  ),
                                  label: const Text(
                                    'buy now',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: recData.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}

class MySpecialOnce extends StatefulWidget {
  const MySpecialOnce({super.key});

  @override
  State<MySpecialOnce> createState() => _MySpecialOnceState();
}

class _MySpecialOnceState extends State<MySpecialOnce> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Scaffold(
        //extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySlider(),
              // ignore: deprecated_member_use
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seasonal drinks',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.brown,
                        ),
                        label: Text(
                          "...more",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MySeasonalDrinks(),
            ],
          ),
        ),
      ),
    );
  }
}

class MySeasonalDrinks extends StatefulWidget {
  const MySeasonalDrinks({super.key});

  @override
  State<MySeasonalDrinks> createState() => _MySeasonalDrinksState();
}

class _MySeasonalDrinksState extends State<MySeasonalDrinks> {
  dynamic data = Seasonal_Data.data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    dynamic keys = data.keys.toList();
    print(keys);

    return Container(
      width: size.width,
      child: GridView.custom(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: size.height * 0.30,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              height: size.height * 0.30,
              width: size.width * 0.48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 2,
                      color: Colors.brown.shade100,
                    )
                  ]),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.18,
                    width: size.width * 0.48,
                    child: Stack(
                      children: [
                        Image.asset(
                          data[keys[index]]['path'],
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child:
                              LikeWidget(color: data[keys[index]]['favourite']),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            // width: size.width * 0.28,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.80),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Center(
                                child: Text(
                                  keys[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up),
                              label:
                                  Text(data[keys[index]]['like'].toString())),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.attach_money,
                                color: Colors.green,
                              ),
                              label: Text(
                                data[keys[index]]['price'].toString(),
                                style: const TextStyle(color: Colors.green),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.orange,
                        ),
                        label: const Text('order now',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline))),
                  ),
                ],
              ),
            );
          },
          childCount: keys.length,
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final _data = SliderData.data;
  late List _keys = [];
  final _pageController = PageController(initialPage: 0);
  int _index = 0;
  bool _scroll = true;

  @override
  void initState() {
    // TODO: implement initState
    _keys = _data.keys.toList();

    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_scroll) {
        print('Im called ${_index}');
        _pageController.animateToPage(_index,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

        _index == (_keys.length - 1) ? _index = 0 : _index++;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _scroll = false;
      },
      child: Container(
          height: size.height * 0.25,
          width: size.width,
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.234),
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (value) {
                  _index = value;
                  _scroll = true;
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        _data[_keys[index]]!['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        child: Text(
                          _keys[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                ),
                              ]),
                        ),
                        left: 5,
                        top: 2,
                      ),
                      Positioned(
                        child: Container(
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.145),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _data[_keys[index]]!['title']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      ),
                                    ]),
                              ),
                              Text(
                                _data[_keys[index]]!['desc']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        right: 5,
                        bottom: 10,
                      ),
                    ],
                  );
                },
                controller: _pageController,
                itemCount: _keys.length,
              ),
              Positioned(
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: _keys.length,
                  // forcing the indicator to use a specific direction
                  textDirection: TextDirection.ltr,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 5,
                    activeDotColor: Colors.red,
                  ),
                ),
                left: 30,
                bottom: 30,
              ),
            ],
          )),
    );
  }
}
