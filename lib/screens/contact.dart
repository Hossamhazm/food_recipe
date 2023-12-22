import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key key}) : super(key: key);
  Widget buildContacts(String wayContact, String textContact,
      IconData contactIcon, double width) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              contactIcon,
              size: 35,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              wayContact,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: width,
            ),
            Text(
              textContact,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text("Contact",style: TextStyle(fontFamily: "Raleway",fontWeight: FontWeight.bold,fontSize: 20,),),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Text("Contact With Us!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
            ),
            SizedBox(
              height: 30,
            ),
            buildContacts("Phone Number", "+201009800731", Icons.phone, 10),
            buildContacts("WhatsApp", "+201009800731", Icons.whatsapp, 70),
            buildContacts("Facebook", "حسام حازم", Icons.facebook, 140),
            buildContacts(
                "Instagram", "hsam_hazm", FontAwesomeIcons.instagram, 110)
          ],
        ),
      ),
    );
  }
}
