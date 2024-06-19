import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:template_assistant/template_config_screen.dart';
import 'package:template_assistant/template_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class TemplateListWidget extends StatefulWidget {
  const TemplateListWidget({super.key});

  @override
  State<TemplateListWidget> createState() => _TemplateListWidgetState();
}





class _TemplateListWidgetState extends State<TemplateListWidget> {


  TableRow _createListItem(String name, String version, Uri url){
    return TableRow(

            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TemplateConfigWidget("", selectedRepo: "tercen/simple_workflow_template"),
                      ),
                    );
                  },
                  child: Text(name),
                )
              ),
              Align(
                alignment: Alignment.center,
                widthFactor: 0.1,
                child: InkWell(
                  onTap: () {
                    launchUrl(url);
                  },
                  child: const ImageIcon( AssetImage("assets/img/github_icon.png"))
                )
                  
              ),

              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 1.0,
                child: 
                  Text(
                    version,
                    style: const TextStyle(color: Color.fromARGB(255, 189, 189, 223))
                  )
                  
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 800,
                height: 500,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(250),
                    1: FixedColumnWidth(30),
                    2: FixedColumnWidth(520)
                    },
                  children: [
                    _createListItem("Simple Workflow Template", "0.0.1",
                                        Uri.https("github.com", "tercen/simple_workflow_template")),
                    _createListItem("Flow Scyan Template", "be825b188608ae6ee261e89864aad9b18d3ba6f9",
                                      Uri.https("github.com", "tercen/flow_scyan_template"))
                  ]
                )
              )
            ]
          )
          
      )
    );
  }

}