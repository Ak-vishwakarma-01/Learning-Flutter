import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// widget are always immutable thats why we need State to make this mutalbe

class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
   
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{  // state allow us to creae a variable to create a function

//  @override
//  void initState(){
//   super.initState();
//   print("rebuild");
//  }

  double currInupt = 0;
  final TextEditingController textEditingController = TextEditingController(); // gives access to the text in the entire widget;
 
  @override
  Widget build(BuildContext context) {  //BuildContext tells the flutter that corencyconverterclass is present here ,it tell about all widget location present in this class
    print("build function");

    final border = OutlineInputBorder( // this is my function in which i have ceated my own variable to use it somewhere
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius:BorderRadius.circular(5),
    );
    return Scaffold(     // scafold make local part of the app.
        backgroundColor:const Color.fromARGB(255, 13, 146, 195),
        
        appBar: AppBar(
          title: const Text(
            "Currency Converter",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 45,
              fontWeight:FontWeight.w700,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 13, 146, 195),
          elevation: 0,
          centerTitle: true,
          actions: const [   // it will be right side of the app like navigtion buttons;
            Text("le bhia",
            ),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ), 

        body: Center(
          child: Column(        // Column doesnot have it's own color
            mainAxisAlignment: MainAxisAlignment.center, // it's column mainaxisalignment is vertical and viceverca for row
            // crossAxisAlignment: CrossAxisAlignment.end, // cross means horizontal viceverca for row
            children: [
              
                 Text(
                  '₹ ${currInupt.toStringAsPrecision(3)}',
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color:Color.fromARGB(255, 255, 255, 255),
                  ), 
                ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                // child: Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 10, ), // giving padding of 8 pixels of screen size;
                    // margin: const EdgeInsets.all(10),
                    child: TextField(                      // to take the userinput, it doesn't have any pading widget
                      controller: textEditingController,           // saving the input data      
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        // labelText:'ye le bhai labletext bhi',
                        hintText: 'le bhai hint bhi lele jo likhne per gayab ho jata hai',
                        // helperText: 'ye le bahi tu bhi helper text',
                        hintStyle: const TextStyle(
                          color:Color.fromARGB(255, 0, 0, 0),
                        ), 
                        prefix: const Icon(Icons.monetization_on_outlined), // it's an icon button
                        prefixIconColor:const Color.fromARGB(255, 176, 240, 57), 
                        filled: true,                    // if you don't make this true then fillColor won't work;
                        fillColor: Colors.white,
                        focusedBorder: border,
                        enabledBorder: border,

                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          // signed: true,
                        ),
                      ),
                ),
              // ), 


              // raised
              // appeared liek a text buttun
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(     
                // buttons 
                  onPressed: (){
                    // debug, realise and profile
                    if(kDebugMode){       // it cheks are we debug mode or not
                      debugPrint('button clicked'); // debut only prints strings
                      setState(() {                                // very important to save state.
                      currInupt = double.parse(textEditingController.text)*81;
                      });
                    }
                  }, 
                  style: TextButton.styleFrom(
                    backgroundColor: (Colors.black),
                    foregroundColor: (Colors.white),
                    minimumSize:const Size(double.infinity,50),        // Use Size from dart:ui
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(Icons.money),       // child should be ending property other property should go above child 
                ),
              ),
            ],
          ), 
        ),
      );
  } 
 
 /*

  Center(  // it centered the column horizontly
  
  )

  return const Scaffold(   // scafold make local part of the app.
        body: Center(   // body have some
          child:Text("hello mai child hooo"),
        ), 
      );



      at the place of this TextButton.styleForm()
      style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.black),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    minimumSize: const WidgetStatePropertyAll(  // Specify maximum width and height
                      ui.Size(double.infinity,50),        // Use Size from dart:ui
                    ),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

 */
   
}