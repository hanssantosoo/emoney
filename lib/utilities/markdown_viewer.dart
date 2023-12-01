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
@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.screenName,
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xff243656),
          elevation: 0,
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              padding: EdgeInsets.only(
                  left: 16.18, right: 16.18, bottom: 16.18, top: 6.18),
              child: FutureBuilder(
                  future: getTextData(widget.urlRequested),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MarkdownWidget(
                        data: '''${snapshot.data}''',
                        styleConfig: StyleConfig(
                            blockQuoteConfig: BlockQuoteConfig(
                              backgroundColor: Color(0xffcaf0f8),
                              blockColor: Color(0xff0077b6),
                              blockStyle:
                                  GoogleFonts.sora(color: Color(0xff495057)),
                            ),
                            tableConfig: TableConfig(
                                headerTextConfig:
                                    TextConfig(textAlign: TextAlign.left),
                                headChildWrapper: (columnHeader) => Padding(
                                      padding: EdgeInsets.all(7.2),
                                      child: columnHeader,
                                    ),
                                headerStyle: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w700),
                                bodyChildWrapper: (cellBody) => Padding(
                                      padding: EdgeInsets.all(7.2),
                                      child: cellBody,
                                    ),
                                bodyTextConfig:
                                    TextConfig(textAlign: TextAlign.center)),
                            titleConfig: TitleConfig(
                                commonStyle: GoogleFonts.ubuntu(),
                                showDivider: false),
                            ulConfig: UlConfig(
                              ulWrapper: (ul) => Padding(
                                padding: EdgeInsets.all(5),
                                child: ul,
                              ),
                              textStyle: GoogleFonts.workSans(),
                              dotWidget: (deep, index) => Text(
                                "${index + 1}.\t",
                                style: GoogleFonts.ubuntu(),
                              ),
                            ),
                            olConfig: OlConfig(
                              olWrapper: (ul) => Padding(
                                padding: EdgeInsets.all(5),
                                child: ul,
                              ),
                              textStyle: GoogleFonts.workSans(),
                              indexWidget: (deep, index) => Text(
                                "${index + 1}.\t",
                                style: GoogleFonts.ubuntu(),
                              ),
                            ),
                            pConfig: PConfig(
                                textStyle: GoogleFonts.workSans(),
                                emStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    backgroundColor: Color(0xffccff33),
                                    fontStyle: FontStyle.italic)),
                            codeConfig: CodeConfig(

                                // padding: EdgeInsets.all(1.618),
                                codeStyle: GoogleFonts.spaceMono(
                                    backgroundColor: Color(0xff4a4e69),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))),
                      );
                    }
                    return docsLoading();
                  }),
            ),
          )
        ]));
  }
