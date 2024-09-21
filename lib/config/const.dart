import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contact.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallery.dart';
import 'package:xtreme_fitness/landingpages/sections/home/home.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/prices.dart';
import 'package:xtreme_fitness/landingpages/sections/services/services.dart';

double navbarsize = 1000;
double mobilescreen = 800;

String appname = "XTREME FITNESS";

List<String> navtitles = ["Dashboard", "Analytics", "Add Members", "Services"];
List<String> dayslist = ["Week", "Months", "Year"];
List<String> dayslist2 = [
  "All",
  "Today",
  "Yesterday",
];
List<String> plancategory = ["Personal", "General", "Zumba", "Aerobic"];

String xtremeemail = "";
String xtremecontact = "";
String xtremeaddress = "";
String xtremefacebook = "";
String xtremeinstagram = "";
String xtremeyoutube = "";

final List<String> navItems = [
  'Home',
  'Pricing',
  'Services',
  'Gallery',
  'Contact'
];

final List<String> galleryimages = [
  'assets/images/1.jpeg',
  'assets/images/2.jpeg',
  'assets/images/3.jpeg',
  'assets/images/4.jpeg',
  'assets/images/5.jpeg',
  'assets/images/6.jpeg',
  'assets/images/7.jpeg',
  'assets/images/8.jpeg',
  'assets/images/9.jpeg',
  'assets/images/10.jpeg',
  'assets/images/11.jpeg',
];

List<Widget> landingwidgets = [
  const HomePage(),
  const Prices(),
  const Services(),
  const Gallery(),
  const Contact()
];


List<String> months = ["Jan","Feb","March","April","May","June","July","August","Sept","Oct","Nov","Dec"];