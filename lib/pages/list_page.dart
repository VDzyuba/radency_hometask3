import 'package:flutter/material.dart';
import 'package:radency_hometask/models/contacts.dart';
import 'package:radency_hometask/pages/person_info.dart';
import 'package:radency_hometask/models/save_provider.dart';
import 'package:radency_hometask/models/sort_by.dart';
import 'package:provider/provider.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void isFavoriteLists() {
    for (var person in contacts) {
      person['isFavorite'] = 'false';
    }
  }


  @override
  void initState() {
    sortByLastName();
    isFavoriteLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radency Hometask #3'),
      ),
      body: Consumer<SaveInfo>(
        builder: (context, save, child) => (ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                  child: groupByAlphabetic(index),
                ),
                Row(
                  children: [
                    Container(
                      width: 40.0,
                      child: IconButton(
                          icon: contacts[index]['person'] == 'true'
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              contacts[index]['person'] =
                                  contacts[index]['person'] == 'true'
                                      ? 'false'
                                      : 'true';
                            });
                          }),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PersonInfo(
                                  index: index,
                                  contact: contacts,
                                );
                              }),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'lib/assets/${contacts[index]['images']}'),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        title: Text(
                            '${contacts[index]['firstName']} ${contacts[index]['lastName']} ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(contacts[index]['company']),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )),
      ),
    );
  }

  // ignore: missing_return
  Text groupByAlphabetic(int index) {
    final textStyle = TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey);

    var firstLetter = contacts[index]['lastName'].toString().substring(0, 1);
    if (--index >= 0) {
      if (firstLetter !=
          contacts[index--]['lastName'].toString().substring(0, 1)) {
        return Text(
          firstLetter,
          style: textStyle,
        );
      }
    } else {
      return Text(firstLetter, style: textStyle);
    }
  }
}
