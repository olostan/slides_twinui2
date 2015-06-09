import 'package:angular/angular.dart';
import 'dart:html' as dom;
import 'package:chrome/chrome_app.dart' as chrome;

@Decorator(
  selector:'[bt-control]'
)
class BluetoothControl implements AttachAware, DetachAware{
  dom.Element _element;
  BluetoothControl(this._element) {
  }
  @override
  void attach() {
    var port = chrome.runtime.connect('lpppmpkhefmmamenpoaiihofndmabpeb');
    port.onMessage.listen( (msg) {
      print("Message ${msg.message['key']}");
      if (msg.message['key']==52) {
        // Not working :( dom.document.dispatchEvent(new dom.KeyEvent('keypress',keyCode:39));
        dom.query("#next").click();
      }
      if (msg.message['key']==50) {
        // Not working :( dom.document.dispatchEvent(new dom.KeyEvent('keypress',keyCode:39));
        dom.query("#previous").click();
      }
      if (msg.message['key']==51) {
        // Not working :( dom.document.dispatchEvent(new dom.KeyEvent('keypress',keyCode:39));
        dom.query("#comments").click();
      }

    });
  }
  @override
  void detach() {

  }
}