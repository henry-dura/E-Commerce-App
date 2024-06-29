import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ActionsIconStack<C extends Cubit<List<dynamic>>> extends StatelessWidget {
  final IconData iconName;
  final linkedPage;
  const ActionsIconStack({
    super.key, required this.iconName, this.linkedPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => linkedPage),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Container
          Container(
            width: 75,
            // height: 200,
            color: Colors.white,
          ),

          // Like Icon
          Positioned(
            top: 10,
            right: 30,
            child: Icon(
              iconName,
              size: 40,
              color: iconName == Icons.favorite?Colors.redAccent:Colors.green,
            ),
          ),

          // Likes Count Container
          Positioned(
            bottom: 25,
            right: 0,
            child: Container(
              constraints:
              const BoxConstraints(maxWidth: 40, maxHeight: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: Center(
                child: BlocBuilder<C, List<dynamic>>(
                  builder: (context, state) {
                    return Text(
                      '${state.length}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





