import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:object_detection_app/about.dart';
import 'package:object_detection_app/camera_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

const _urlGit = 'https://github.com/metekaya';
const _urlLinkedIn = 'https://www.linkedin.com/in/mete-kaya-2a57b31a7/';

class HomePage extends StatelessWidget {
  void _launchGithub() async => await canLaunch(_urlGit)
      ? await launch(_urlGit)
      : throw 'Could not launch $_urlGit';
  void _launchLinkedIn() async => await canLaunch(_urlLinkedIn)
      ? await launch(_urlLinkedIn)
      : throw 'Could not launch $_urlLinkedIn';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: RotatedBox(
                quarterTurns: 2,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [
                        Colors.red,
                        Colors.lime,
                      ],
                      [
                        Colors.amber,
                        Colors.grey,
                      ]
                    ],
                    durations: [19440, 10800],
                    heightPercentages: [0.20, 0.20],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  size: Size(
                    double.infinity,
                    double.infinity,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feedlogo.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Obje Dedektörü',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 45),
                Material(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, CameraPage.routeName),
                    borderRadius: BorderRadius.circular(18),
                    highlightColor: Colors.amber.shade100,
                    splashColor: Colors.amber.shade200,
                    child: Container(
                      width: 200,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Başlat',
                          style: TextStyle(
                              fontSize: 28, color: Colors.amber.shade300),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Material(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AboutPage.routeName),
                    borderRadius: BorderRadius.circular(18),
                    highlightColor: Colors.amber.shade100,
                    splashColor: Colors.amber.shade200,
                    child: Container(
                      width: 200,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Hakkında',
                          style: TextStyle(
                              fontSize: 28, color: Colors.amber.shade300),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: Colors.amber,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text(
                      'Diğer Projelerim İçin',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: Colors.amber,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlineButton(
                      onPressed: _launchGithub,
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.red.shade300,
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.logo_github,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Github ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    OutlineButton(
                      onPressed: _launchLinkedIn,
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.blue.shade300,
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue.shade400,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.logo_linkedin,
                            size: 16,
                            color: Colors.blue.shade400,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Linkedin',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
