import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.commentDots,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                  "Over 3+ years of experience in android application development and over 1+ years of experience in Flutter Framework"),
            ),
            _buildTitle("Skills"),
            _buildSkillsRow("Java", 0.85),
            SizedBox(
              height: 5.0,
            ),
            _buildSkillsRow("Flutter", 0.5),
            SizedBox(
              height: 5.0,
            ),
            _buildSkillsRow("HTML & CSS", 0.7),
            SizedBox(
              height: 5.0,
            ),
            _buildSkillsRow("Firebase", 0.8),
            SizedBox(
              height: 5.0,
            ),
            _buildSkillsRow("Photoshop", 0.65),
            SizedBox(
              height: 10.0,
            ),
            _buildTitle("Education"),
            _buildEducation(
                "Softwarica College of IT & Ecommerce",
                "Bachelor of Computer Science & Information Technology",
                "2013 - 2017"),
            _buildEducation(
                "Global College of Management", "+2", "2011 - 2013"),
            _buildEducation("The New Summit School", "Nepal Board", "2010"),
            SizedBox(
              height: 10.0,
            ),
            _buildTitle("Contact"),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30.0,
                ),
                Icon(
                  Icons.mail,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "spyderbibek22@gmail.com",
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
            _buildSocialsRow(),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: CachedNetworkImageProvider(
                  "http://bkshah.com.np/img/avatar.jpg"),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Bibek Shah",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Android Developer",
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.map,
                  color: Colors.black54,
                  size: 12.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Kathmandu, Nepal",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          )
        ],
      ),
    );
  }

  Row _buildSkillsRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            skill.toUpperCase(),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        SizedBox(
          width: 16.0,
        )
      ],
    );
  }

  ListTile _buildEducation(String company, String position, String duration) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.facebookF),
          onPressed: () {
            _launchUrl("https://www.facebook.com/spyderbibek");
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () {
            _launchUrl("https://www.instagram.com/spyderbibek/");
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.github),
          onPressed: () {
            _launchUrl("https://github.com/spyderbibek");
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.googlePlay),
          onPressed: () {
            _launchUrl(
                "https://play.google.com/store/apps/dev?id=7783539868370147718");
          },
        )
      ],
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launc $url";
    }
  }
}
