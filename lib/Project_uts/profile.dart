import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeveloperIntroductionForm extends StatefulWidget {
  @override
  _DeveloperIntroductionFormState createState() =>
      _DeveloperIntroductionFormState();
}

class _DeveloperIntroductionFormState extends State<DeveloperIntroductionForm> {
  String selectedProfile = 'Facebook';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/photo.jpg'),
              radius: 80.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Muhammad Rizki Herdian',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NRP 152021006',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Kuliah di ITENAS',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 30.0),
            DropdownButton<String>(
              value: selectedProfile,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProfile = newValue!;
                });
              },
              items: <String>['Facebook', 'Instagram', 'GitHub']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _launchProfile(selectedProfile);
              },
              icon: selectedProfile == 'Facebook'
                  ? Icon(Icons.facebook)
                  : selectedProfile == 'Instagram'
                      ? FaIcon(FontAwesomeIcons.instagram)
                      : FaIcon(FontAwesomeIcons.github),
              label: Text(selectedProfile),
            ),
          ],
        ),
      ),
    );
  }

  _launchProfile(String selectedProfile) async {
    final Map<String, String> profileUrls = {
      'Facebook': 'https://www.facebook.com/twins.ext.7/',
      'Instagram': 'https://www.instagram.com/mr.herdian1/',
      'GitHub': 'https://github.com/NewEntery',
    };

    final String selectedProfileURL = profileUrls[selectedProfile]!;
    if (await canLaunch(selectedProfileURL)) {
      await launch(selectedProfileURL);
    } else {
      throw 'Tidak dapat membuka $selectedProfileURL';
    }
  }
}
