import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radency_hometask/models/contacts.dart';
import 'package:radency_hometask/models/save_provider.dart';
import 'package:provider/provider.dart';
import 'package:radency_hometask/models/sort_by.dart';

class PersonInfo extends StatelessWidget {
  PersonInfo({
    Key key,
    this.index,
    this.contact,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final int index;
  final List<Map<String, String>> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  context.read<SaveInfo>().saveInfo();
                  sortByLastName();
                  Navigator.pop(context);
                }
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('lib/assets/${contact[index]['images']}'),
                backgroundColor: Colors.blue,
                radius: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextFormField(
                                maxLength: 25,
                                initialValue: contacts[index]['firstName'],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (text) {
                                  contacts[index]['firstName'] = text;
                                },
                                validator: (text) =>
                                    text.isEmpty ? 'Enter First name' : null,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Name',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextFormField(
                                maxLength: 25,
                                initialValue: contacts[index]['lastName'],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (text) {
                                  contacts[index]['lastName'] = text;
                                },
                                validator: (text) =>
                                    text.isEmpty ? 'Enter Last name' : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Phone number',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      // inputFormatters: <TextInputFormatter>[
                      //     FilteringTextInputFormatter.singleLineFormatter
                      //  ],
                      initialValue: contact[index]['phone'],
                      onSaved: (text) {
                        contact[index]['phone'] = text;
                      },
                      validator: (text) =>
                          text.isEmpty ? 'Enter phone number' : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Company name',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      initialValue: contacts[index]['company'],
                      onSaved: (text) {
                        contacts[index]['company'] = text;
                      },
                      //validator: (text) => text!.isEmpty ? 'Введіть ім`я' : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 4,
                      initialValue: contact[index]['bio'],
                      onSaved: (text) {
                        contact[index]['bio'] = text;
                      },
                      //validator: (text) => text!.isEmpty ? 'Введіть ім`я' : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
