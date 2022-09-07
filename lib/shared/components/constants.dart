import 'package:flutter/material.dart';

bool? isDark;

String token = '';

String imageLink = 'https://image.tmdb.org/t/p/w500';

String upComing = 'Upcoming';

String nowPlaying = 'Now Playing';

String topRated = 'Top Rated';

String popular = 'Popular';

const KprimaryColor = Color(0xFF1B383A);
const KsecondryColor = Color(0xFF59706F);
const KdarkGrayColor = Color(0xFFA8A8A8);
const KwhiteColor = Color(0xFFFFFFFF);
const KZambeziColor = Color(0xFF585858);
const KblackColor = Color(0xFF272726);
const KTextFieldColor = Color(0xFF979797);
const KDefaultPadding = EdgeInsets.symmetric(horizontal: 30.0);

TextStyle titleText = TextStyle(
  color: KprimaryColor,
  fontSize: 32,
  fontWeight: FontWeight.w700,
);

TextStyle subTitle = TextStyle(
  color: KsecondryColor,
  fontSize: 18,
  fontWeight: FontWeight.w500,

);
TextStyle splashTitle = TextStyle(
  color: KwhiteColor,
  fontSize: 32,
  fontWeight: FontWeight.bold,

);

TextStyle textButton = TextStyle(
  color: KprimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 18,
);
