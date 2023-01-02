import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _githubUrl = ' ';
  final int _defaultTabLenght = 4;
  // String _randomImage = 'https://picsum.photos/id/237/200/300';

  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: DefaultTabController(
        length: _defaultTabLenght,
        child: Column(
          //appBar'ı custom olarak yazabilmek için contanier verdik. Bu sayede sayfada başka app bar varmış gibi gözükmedi.
          children: [
            _contanierAppBar,
            _tabBarItems,
            _expandedListView,
          ],
        ),
      ),
    );
  }

  Widget get _expandedListView => Expanded(
        child: _listview,
      );
  Widget get _listview => ListView.builder(
      itemCount: 10,
      controller: scrollController,
      itemBuilder: (context, index) {
        return const Text(
          "data",
        );
      });

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
              //backgroundImage: NetworkImage(_randomImage),
              ),
          title: Wrap(
            children: [Text('data')],
          ),
        ),
      );

  Widget get _contanierAppBar => Container(
        height: 50,
        child: _appBar,
      );

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.adb),
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );
  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_githubUrl),
          ),
          Text('Home')
        ],
      );

  Widget get _tabBarItems => const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.dashboard),
          ),
          Tab(
            icon: Icon(Icons.dashboard),
          ),
          Tab(
            icon: Icon(Icons.dashboard),
          ),
          Tab(
            icon: Icon(Icons.dashboard),
          )
        ],
      );
}

final titleTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
