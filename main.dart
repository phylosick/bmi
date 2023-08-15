import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  get child => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Your BMI'),
      ),
      body: Container(
        color: Colors.red.shade100,
        child: Center(

          child: Container(
            color: Colors.red.shade100,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34,
              fontWeight: FontWeight.w700),),
              TextField(
              controller: wtController,
            decoration: InputDecoration(
            label: Text('Enter your Weight(in kg)'),
    prefixIcon: Icon(Icons.height),
            ),
                keyboardType: TextInputType.number,
    ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI calculation
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);
                    if(bmi>25){

                    } else if(bmi<18){

                    } else {

                    }
                    setState(() {
                      result = "Your BMI is = $bmi";
                    });
                } else {
                    setState(() {
                      result = "Please fill all the blanks";
                    });
                  }

                  },

                    child: Text('Calculate')),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 18),),
    ]
            ),
          ),
        ),
      )
    );
  }
}
