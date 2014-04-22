// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.

library app_element;

import 'dart:html' as dom;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/polymer_selection/polymer_selection.dart' show PolymerSelection;

@CustomTag('app-element')
class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  void enteredView() {
    super.enteredView();
    var lastElem = ($['content'] as dom.ContentElement).getDistributedNodes().where((e) => e is dom.HtmlElement).last;
    (this.$['selection'] as PolymerSelection).select(lastElem);
  }

  void itemTapAction(dom.MouseEvent e, detail, dom.HtmlElement target) {
    (this.$['selection'] as PolymerSelection).select(e.target);
  }

  void selectAction(dom.Event e, detail, dom.HtmlElement target) {
    detail['item'].classes.toggle('selected', detail['isSelected']);
    if(!(detail['item'] as dom.HtmlElement).innerHtml.contains('Blue')) {
      (detail['item'] as dom.HtmlElement).remove();
    }
  }
}