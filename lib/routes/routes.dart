import 'package:flutter/material.dart';
import 'package:flutter_designs/challengs/animation_challenge_page.dart';
import 'package:flutter_designs/pages/animations_page.dart';
import 'package:flutter_designs/pages/emergency_page.dart';
import 'package:flutter_designs/pages/header_page.dart';
import 'package:flutter_designs/pages/pinterest_page.dart';
import 'package:flutter_designs/pages/progress_page.dart';
import 'package:flutter_designs/pages/slideshow_page.dart';
import 'package:flutter_designs/pages/sliver_list_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.heading, 'Header', HeaderPage()),
  _Route(FontAwesomeIcons.angellist, 'Animation', AnimationsPage()),
  _Route(FontAwesomeIcons.disease, 'Animation Challenge', AnimationChallengePage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress', ProgressPage()),
  _Route(FontAwesomeIcons.shopware, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.slideshare, 'Sliver List', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
