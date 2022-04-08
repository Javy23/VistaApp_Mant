import 'package:flutter/material.dart';
import 'package:mvp_all/style/colors/colors_views.dart';
import 'package:mvp_all/pages/progress_view.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;
  final PageController _pageController = PageController(initialPage: 0);

  //bool _visible = true;
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": "ESPARCIMIENTO",
      "text1": "Brindamos todos los servicios para consentir",
      "image": 'assets/images/B1.png',
    },
    {
      "text": "ADOPCIÓN",
      "text1": "Adopcion de mascotas",
      "image": 'assets/images/B2.png',
    },
    {
      "text": "HOSPITALIDAD",
      "text1": "Completa hospitalidad",
      "image": 'assets/images/B3.png',
    },
    {
      "text": "VETERINARIA",
      "text1": "Servicio de veterinaria",
      "image": 'assets/images/B4.png',
    },
    {
      "text": "TIENDA",
      "text1": "Tienda de articulos",
      "image": 'assets/images/B5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    int tamanio = onBoardingDatas.length;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        pages = value;
                        //print(pages);
                      });
                    },
                    itemCount: tamanio,
                    itemBuilder: (context, index) => ContentBoarding(
                      text: onBoardingDatas[index]["text"],
                      text1: onBoardingDatas[index]["text1"],
                      image: onBoardingDatas[index]["image"],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoardingDatas.length,
                            (index) => newMethod(index: index)),
                      ),
                    ],
                  ),
                ),
                _buttonBoarding(index: pages, tam: tamanio)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer newMethod({int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 8),
      height: 4,
      width: pages == index ? 20 : 20,
      decoration: BoxDecoration(
        color: pages == index
            ? ColorsSelect.paginatorNext
            : ColorsSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  _buttonBoarding({int index, int tam}) {
    if (index != tam - 1) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.ease);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text("Siguiente"),
            ],
          ),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              onPrimary: ColorsSelect.btnTextBo1,
              primary: ColorsSelect.btnTextBo2,
              //onPrimary: Colors.white,
              textStyle: const TextStyle(fontSize: 17, color: Colors.black),
              side: const BorderSide(
                color: ColorsSelect.btnTextBo1,
                width: 3,
              ),
              //primary: ColorsSelect.btnBackgroundBo1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            const ProgressView();
            Navigator.of(context).pushNamed('/ProgressView');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text("Continuar"),
            ],
          ),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              primary: ColorsSelect.btnBackgroundBo2,
              textStyle: const TextStyle(fontSize: 17, color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      );
    }
  }
}

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key key,
    this.text,
    this.text1,
    this.image,
  }) : super(key: key);

  final String text, text1, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              width: 290,
              height: 290,
            ),
            Text(
              text,
              style: const TextStyle(
                color: ColorsSelect.txtBoHe,
                fontSize: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsSelect.txtBoSubHe,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
