import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
   return _HomeState();
  }

}

class _HomeState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas a Pagar'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 130,
                      height: 50,
                      child: const Text("Previsto"),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 130,
                      height: 50,
                      child: const Text("Realizado"),
                    ),
                  ),
                ],
              ),
             Expanded(
              child:  ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                 return ListTile(
                  title: Text('Item $index'),
                 );
                },
              ),
              ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed("/form");
        }),
    );
  }

}