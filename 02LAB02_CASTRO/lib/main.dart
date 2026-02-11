import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// import flutter material design and google fonts

// text, container, scaffold, appbar, etc.

void main() {

  runApp(const SimplePortfolioApp());

  // starting point of every dart file

  

  // flutter function that runs our application

  // function - standalone block of code

  // method - a function that define within a class and operates on objects data

  // MyApp() - your application

}



class SimplePortfolioApp extends StatelessWidget {

  const SimplePortfolioApp({Key? key}) :super(key : key);

    // class name

    // doesn't change

    // activate the class build




    

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Simple PortFolio', // title of the app

      home:  HomePage(), // home text

      debugShowCheckedModeBanner: false,

    );

  }

}

class HomePage extends StatefulWidget{

  const HomePage({Key? key}) : super(key: key);

  @override 

  State<HomePage> createState() => _HomePageState();

  

}

// return state objects

// state for the homepage 

// create state for the method

// _HomePageState holds data that can change, trigger rebuilding of our application



class _HomePageState extends State<HomePage>{

  

  String selectedPage = 'Home';

  late ScrollController _scrollController;



    Widget _buildContent() {

  if (selectedPage == 'Home') {

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        ClipOval(

          child: Image.asset(

            'lib/assets/images/porti.jpg',

            width: 120,

            height: 120,

            fit: BoxFit.cover,

          ),

        ),

        SizedBox(height: 16),

        Text(

          'Christian Warren Castro',

          style: GoogleFonts.poppins(

            fontSize: 24,

            fontWeight: FontWeight.bold,

          ),

        ),

        SizedBox(height: 8),

        Text(

          'Flutter Developer',

          style: GoogleFonts.roboto(

            fontSize: 16,

            color: Colors.grey[600],

          ),

        ),

      ],

    );

  }

 else if (selectedPage == 'About') {

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        ClipOval(

          child: Image.asset(

            'lib/assets/images/porti.jpg',

            width: 120,

            height: 120,

            fit: BoxFit.cover,

          ),

        ),

        SizedBox(height: 16),

        Text(

          'Computer Science Student at STI College Calooocan.',

          style: GoogleFonts.poppins(

            fontSize: 24,

            fontWeight: FontWeight.bold,

          ),

        ),

        SizedBox(height: 8),

        Text(

          'Flutter Developer',

          style: GoogleFonts.roboto(

            fontSize: 16,

            color: Colors.grey[600],

          ),

        ),

      ],

    );

  }

 else if (selectedPage == 'Skills') {

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        ClipOval(

          child: Image.asset(

            'lib/assets/images/porti.jpg',

            width: 120,

            height: 120,

            fit: BoxFit.cover,

          ),

        ),

        SizedBox(height: 16),

        Text(

          'Problem solving, critical thinking,Digital literacy',

          style: GoogleFonts.poppins(

            fontSize: 24,

            fontWeight: FontWeight.bold,

          ),

        ),

        SizedBox(height: 8),

        Text(

          'Flutter Developer',

          style: GoogleFonts.roboto(

            fontSize: 16,

            color: Colors.grey[600],

          ),

        ),

      ],

    );

  }

  return Text('Coming soon: $selectedPage');

}

  @override

  Widget build(BuildContext context) {

  return Scaffold ( // page structure(hold appBar, drawer, body)

    backgroundColor: Color(0xFFF5F5F5),

    appBar: AppBar(

      leading: Builder(

        builder: (BuildContext context){

          return IconButton(

            icon : Icon(Icons.menu),

            onPressed: (){

              Scaffold.of(context).openDrawer();

            },

          );

        }

      ),

      title: Text('Portfolio',

      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600

        ),

      ),// appbar title

    ),

    drawer: Drawer(

      child: ListView(

        padding: EdgeInsets.zero,

        children: [

          DrawerHeader(

            decoration: BoxDecoration(

              color:Color.fromARGB(106, 116, 177, 36) ,

            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.end,

              children: [

                

                ClipOval(

            child: Image.asset('lib/assets/images/porti.jpg',

            width: 60,

            height: 60,

            fit: BoxFit.cover,



            ),

          ),

                Text('Christian Warren Castro'),

                SizedBox(height: 4),

                Text('Future Developer')



              ],

            )

          )

          // dito yung list view 

          ,ListTile(

          leading: Icon(Icons.home, color: Color.fromARGB(106, 116, 177, 36) ),

          title: Text('Home'),

          onTap: () {

          Navigator.pop(context);

          setState(() {

      selectedPage = 'Home';

    });

  },

),

ListTile(

  leading: Icon(Icons.person, color:Color.fromARGB(106, 116, 177, 36)),

  title: Text('About'),

  onTap: () {

    Navigator.pop(context);

    setState(() {

      selectedPage = 'About';

    });

  },

),

ListTile(

  leading: Icon(Icons.lightbulb, color: Color.fromARGB(106, 116, 177, 36) ),

  title: Text('Skills'),

  onTap: () {

    Navigator.pop(context);

    setState(() {

      selectedPage = 'Skills';

    });

  },

),

ListTile(

  leading: Icon(Icons.email, color: Color.fromARGB(106, 116, 177, 36)),

  title: Text('Contact'),

  onTap: () {

    Navigator.pop(context);

    setState(() {

      selectedPage = 'Contact';

    });

  },

),

Divider(),

ListTile(

  leading: Icon(Icons.download, color: Color.fromARGB(106, 116, 177, 36) ),

  title: Text('Download Resume'),

  onTap: () {

    Navigator.pop(context);

    print('Download Resume tapped');

  },

),

        ],

      ),

    ),

    

    body: SingleChildScrollView(

  controller: _scrollController,

  child: Padding(

    padding: EdgeInsets.all(20),

    child: Center(

      child: _buildContent(),

    ),

  ),

),

    

  ); // scaffold

  }

@override

void initState() {

  super.initState();

  _scrollController = ScrollController();

}



@override

void dispose() {

  _scrollController.dispose();

  super.dispose();

}

}