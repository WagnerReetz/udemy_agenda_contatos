import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    helper.getAllContact().then((value) {
      setState(() {
        contacts = value as List<Contact>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const Icon add = Icon(Icons.add);
    const Text title = Text("Contatos");
    const EdgeInsets paddingList = EdgeInsets.all(10.0);

    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: add,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: paddingList,
          itemCount: contacts.length,
          itemBuilder: (context, index) {

          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img != null ? 
                      FileImage(File(contacts[index].img)) as ImageProvider<Object> : 
                      AssetImage("images/person.png")
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(children: <Widget>[ 
                  Text(contacts[index].name ?? "",
                       style: TextStyle(fontSize: 22.0,
                       fontWeight: FontWeight.bold),
                       )
                ],
              )

            ],
          ),
        ),
      ),
    )
  }
}
