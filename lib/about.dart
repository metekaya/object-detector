import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

const _urlTwitter = 'https://twitter.com/metekkaya';

class AboutPage extends StatelessWidget {
  static const routeName = '/AboutPage';
  @override
  _launchMail() async {
    final url = Uri.encodeFull(
        'mailto:metekaya55@gmail.com?subject=News&body=New plugin');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTwitter() async => await canLaunch(_urlTwitter)
      ? await launch(_urlTwitter)
      : throw 'Could not launch $_urlTwitter';

  void getDcUsername() {
    Clipboard.setData(
      ClipboardData(text: "Mete Kaya#9601"),
    );
    Fluttertoast.showToast(
      msg: "Kullanıcı adı panoya kopyalandı!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 700,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Uygulama Hakkında',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Divider(
                    height: 30,
                    color: Colors.grey.shade800,
                    thickness: 2,
                  ),
                  Text(
                    'Öncelikle merhaba, uygulamayı kullanmak için giriş sayfasındaki başlat butonuna basınız. '
                    'Gelen ekrandan kamera butonuna tıklayınız. Kamerayı kullanma iznini verdikten sonra uygulama, '
                    'kameranızda görünen objelerin ne olduğunu anlık olarak, alttaki bölüme otomatik bir şekilde yazdıracaktır.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    '\nUygulama kamerada gözüken hiçbir görüntüyü kaydetmemektedir!',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Text(
                    '\nUygulamada Flutter bünyesindeki Tensorflow Lite kütüphanesini kullandım. Eğitilmiş Mobilenet modelini uygulamaya entegre '
                    'ettikten sonra kamera izinlerini ayarladım ve görüntülenen anlık görüntüyü stream olarak bir değişkende tuttum. Bu değişkende '
                    'bulunan görüntüyü modelle karşılaştırarak uygulamanın alt kısmında bulunan bölüme yazdırdım.',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                  ),
                  Text(
                    '\nBu uygulama kendimi geliştirmek amaçlı açık kaynaklı kodlar takip edilerek üzerinde oynamalar yapılarak yazılmıştır.'
                    ' Herhangi bir kâr amacı gütmemektedir.',
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 160,
                          width: 135,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('./assets/images/metekaya.jpeg'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Mete Kaya',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bilgisayar Mühendisi',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  iconSize: 25,
                                  onPressed: _launchTwitter,
                                  icon: Icon(
                                    Ionicons.logo_twitter,
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 25,
                                  onPressed: _launchMail,
                                  icon: Icon(Ionicons.logo_google,
                                      color: Colors.red.shade600),
                                ),
                                IconButton(
                                  iconSize: 25,
                                  onPressed: getDcUsername,
                                  icon: Icon(
                                    Ionicons.logo_discord,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
