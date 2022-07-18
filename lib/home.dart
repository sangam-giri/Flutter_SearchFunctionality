import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: (){
            showSearch(
            context: context, 
            delegate: CustomSearchDeligate(),);
          }, 
          icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}

class CustomSearchDeligate extends SearchDelegate{

/*Use this Dynamically in Production*/
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Oranges',
    'Blueberries'
  ];

/*Clears the SearchSpace*/
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        }
      ),
    ];
  }

  /*cancelling the search option*/
  @override
  Widget buildLeading(BuildContext context){
    return 
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){
          close(context, null);
        }
      );
    
  }

/*Search Results*/
  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

/*Show suggestions*/
  @override
  Widget buildSuggestions(BuildContext context){
      List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }


}