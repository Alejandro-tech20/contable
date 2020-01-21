import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final Function funccion;
  

   BottomIcon({Key key, this.icon, this.funccion}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
          
        ),
      ),
      onTap: funccion,
    );
  }
}

class AutomacticIcons{
  static Map<String, IconData> listIcons={
    'food': FontAwesomeIcons.utensils,
    'bus': FontAwesomeIcons.bus,
    'water': FontAwesomeIcons.shower,
    'house': FontAwesomeIcons.home,
    'electric': FontAwesomeIcons.plug,
    'dress': FontAwesomeIcons.tshirt,
    'gas': FontAwesomeIcons.oilCan,
  };

}
