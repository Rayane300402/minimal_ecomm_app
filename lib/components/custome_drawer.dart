import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  final bool isHome;
  const MyDrawer({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //header to add logo
          Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: const DividerThemeData(color: Colors.transparent),
                ),
                child: DrawerHeader(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //shop tile
              MyListTile(text: 'Shop', icon: Icons.home, onTap: () {
                Navigator.pop(context);

                if(!isHome){
                  Navigator.pushNamed(context, '/shop_page');
                }
              }),

              // cart tile
              MyListTile(text: 'Cart', icon: Icons.shopping_cart, onTap: (){
                Navigator.pop(context);

                if(isHome) {
                  Navigator.pushNamed(context, '/cart_page');
                }
              }
    ,),
            ],
          ),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom:25.0),
            child: MyListTile(text: 'Exit', icon: Icons.logout, onTap: (){
              Navigator.pop(context);

              Navigator.pushNamed(context, '/intro_page');
            },),
          )
        ],
      ),
    );
  }
}
