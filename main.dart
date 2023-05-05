import 'package:flutter/material.dart'; 

import 'edit_person_page.dart'; 

 

void main() { 

  runApp(MyApp()); 

} 

 

class Person { 

  final String name; 

  final String address; 

  final String birthday; 

  final String imageUrl; 

  Person(this.name, this.address, this.birthday, this.imageUrl); 

} 

 

class MyApp extends StatefulWidget { 

  @override 

  _MyAppState createState() => _MyAppState(); 

} 

 

class _MyAppState extends State<MyApp> { 

  final List<Person> _people = [ 

    Person('Christine Anchiboy', 'Encoder-MIS', '60 pesos/hr', 

        'https://scontent.fmnl17-5.fna.fbcdn.net/v/t39.30808-6/316129209_8659249384148240_5555854312016459413_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeHzsgWHSr2ZQwsR-a3q1DnxkvQ0-4G-C2iS9DT7gb4LaDW1BqKlfAWHsy4OihdEeWCwusMgULPd669kMbJpZX_3&_nc_ohc=tmGTJzbIiycAX8K2cOg&_nc_ht=scontent.fmnl17-5.fna&oh=00_AfCoXYI9cHG_dxLJLhBo3g9fzOw7GKhgDehBvQGDV2vRIQ&oe=6459009E'), 

    Person('Rannia Narra', 'Cashier-MIS', '120 pesos/hr', 

        'https://pbs.twimg.com/media/DFC6Kr7V0AAlTZi.jpg'), 

    Person('Paul Anchiboy', 'Analyst-MIS', '100 pesos/hr', 

        'https://bigwishes.net/wp-content/uploads/fb-stylish-dp-for-girls.jpg'), 

    Person('Jackson Soriano', 'Manager', '60 pesos/hr', 

        'https://i.pinimg.com/736x/16/51/61/165161fb0b30e2f62ba8f12900e80242.jpg'), 

  ]; 

  void _updatePerson(int index, Person person) { 

    setState(() { 

      _people[index] = person; 

    }); 

  } 

 

  void _addPerson(Person person) { 

    setState(() { 

      _people.add(person); 

    }); 

  } 

 

  @override 

  Widget build(BuildContext context) { 

    return MaterialApp( 

      title: ' Christine Anchiboy MIDTERM EXAM', 

      theme: ThemeData( 

        primarySwatch: Colors.lightBlue, 

      ), 

      home: Scaffold( 

        appBar: AppBar( 

          title: Text('USER PROFILE'), 

        ), 

        body: Container( 

          decoration: BoxDecoration( 

            image: DecorationImage( 

              image: AssetImage('assets/bg1.jpg'), 

              fit: BoxFit.cover, 

            ), 

          ), 

          child: ListView.separated( 

            padding: EdgeInsets.all(16.0), 

            separatorBuilder: (BuildContext context, int index) => 

                SizedBox(height: 16.0), 

            itemCount: _people.length, 

            itemBuilder: (BuildContext context, int index) { 

              Person person = _people[index]; 

              return Card( 

                color: Color(0xFFDFE4E4), 

                child: ListTile( 

                  contentPadding: EdgeInsets.all(16.0), 

                  leading: CircleAvatar( 

                    backgroundImage: NetworkImage(person.imageUrl), 

                  ), 

                  title: Text( 

                    person.name, 

                    style: TextStyle( 

                      fontSize: 20.0, 

                      fontWeight: FontWeight.bold, 

                      color: Color.fromARGB(255, 0, 0, 0), 

                    ), 

                  ), 

                  subtitle: Column( 

                    crossAxisAlignment: CrossAxisAlignment.start, 

                    children: [ 

                      SizedBox(height: 8.0), 

                      Text( 

                        'Position', 

                        style: TextStyle( 

                          fontSize: 14.0, 

                          fontWeight: FontWeight.bold, 

                          color: Colors.black, 

                        ), 

                      ), 

                      SizedBox(height: 10.0), 

                      Text( 

                        person.address, 

                        style: TextStyle( 

                          fontSize: 14.0, 

                          color: Colors.black, 

                        ), 

                      ), 

                      SizedBox(height: 8.0), 

                      Text( 

                        'Rate:', 

                        style: TextStyle( 

                          fontSize: 14.0, 

                          fontWeight: FontWeight.bold, 

                          color: Colors.black, 

                        ), 

                      ), 

                      SizedBox(height: 10.0), 

                      Text( 

                        person.birthday, 

                        style: TextStyle( 

                          fontSize: 14.0, 

                          color: Colors.black, 

                        ), 

                      ), 

                    ], 

                  ), 

                  trailing: ElevatedButton.icon( 

                    icon: Icon(Icons.edit), 

                    label: Text("Edit Profile"), 

                    onPressed: () async { 

                      final result = await Navigator.push( 

                        context, 

                        MaterialPageRoute( 

                          builder: (BuildContext context) => EditPersonPage( 

                            person: person, 

                            index: index, 

                          ), 

                        ), 

                      ); 

                      if (result != null) { 

                        if (result['isNew'] == true) { 

                          _addPerson(result['person']); 

                        } else { 

                          _updatePerson(result['index'], result['person']); 

                        } 

                      } 

                    }, 

                  ), 

                ), 

              ); 

            }, 

          ), 

        ), 

      ), 

    ); 

  } 

} 
