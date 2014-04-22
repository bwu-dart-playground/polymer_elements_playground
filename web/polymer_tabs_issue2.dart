library polymer_tabs_issue;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_ui_elements/polymer_ui_tabs/polymer_ui_tabs.dart';
import 'package:polymer_ui_elements/polymer_ui_pages/polymer_ui_pages.dart';
//import 'package:logging/logging.dart' show Logger;

// see http://stackoverflow.com/questions/23083760

@CustomTag('polymer-tabs-issue2')
class ResultElementDyn extends PolymerElement {

  PolymerUiTabs tabElement;
  PolymerUiPages pageElement;
  @published dynamic selectedTab;

  ResultElementDyn.created() : super.created() {
    buildDom();
  }

  @override
  void ready() {
    selectedTab = '1';
  }

  void setSelectedInTab(CustomEvent e) {
    print('in setSelectedInTab $selectedTab, ${e.detail}');
  }

  void setSelectedInPage(CustomEvent e) {
    print('in setSelectedInPage $selectedTab, ${e.detail}');
  }

  void buildDom() {
    print('in buildDom');

    tabElement = new Element.tag('polymer-ui-tabs');
    tabElement.setAttribute("id", "dtabs");
    //tabElement.setAttribute("selected", "{{selectedTab}}");
    tabElement.bind('selected', new PathObserver(this, 'selectedTab'));
    //tabElement.setAttribute("on-polymer-select", "{{setSelectedInTab}}");
    tabElement.onPolymerSelect.listen((e) => setSelectedInTab(e));

    Element spanelement = new SpanElement();
    spanelement.innerHtml = 'One';
    tabElement.children.add(spanelement);

    spanelement = new SpanElement();
    spanelement.innerHtml = 'Two';
    tabElement.children.add(spanelement);

    spanelement = new SpanElement();
    spanelement.innerHtml = 'Three';
    tabElement.children.add(spanelement);

    this.shadowRoot.append(tabElement);
    this.shadowRoot.append(new DivElement());

    pageElement = new Element.tag('polymer-ui-pages');
    pageElement.setAttribute("id", "dpages");
    //pageElement.setAttribute("selected", "{{selectedTab}}");
    pageElement.bind('selected', new PathObserver(this, 'selectedTab'));

    //pageElement.setAttribute("on-polymer-select", "{{setSelectedInPage}}");
    pageElement.onPolymerSelect.listen((e) => setSelectedInPage(e));

    spanelement = new SpanElement();
    spanelement.innerHtml = 'Page 1';
    pageElement.children.add(spanelement);

    spanelement = new SpanElement();
    spanelement.innerHtml = 'Page 2';
    pageElement.children.add(spanelement);

    spanelement = new SpanElement();
    spanelement.innerHtml = 'Page 3';
    pageElement.children.add(spanelement);

    this.shadowRoot.append(pageElement);
    //this.templateInstance.firstNode.append(pageElement);
  }
}
