import 'dart:io';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import 'package:markdown_widget/markdown_widget.dart';

import 'package:emoney/utilities/display_error_alert.dart';

class HadWinMarkdownViewer extends StatefulWidget {
  final String screenName;
  final String urlRequested;
  const HadWinMarkdownViewer(
      {Key? key, required this.screenName, required this.urlRequested});
  @override
  HadWinMarkdownViewerState createState() => HadWinMarkdownViewerState();
}

class HadWinMarkdownViewerState extends State<HadWinMarkdownViewer> {
  @override
  void initState() {
    super.initState();
  }
