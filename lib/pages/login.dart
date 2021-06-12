import 'package:flutter/material.dart';
import 'package:tutorial/utils/routes.dart';


class LogIn extends StatefulWidget {

  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String name ="";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, myRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

            children: [
              Image.asset("assets/images/login_page.png",fit: BoxFit.cover,),
              SizedBox(height: 20.0,),
              Text('Welcome $name',
                style: (TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username"
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (String value) async{
                         name = value;
                         setState(() {
                         });
                      },
                    ),
                    TextFormField(

                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                      ),
                      validator: (value){
                        if (value == null || value.length < 5){

                          return "Password Cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0,),
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(changedButton?20:8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton?100:150,
                          height: 50,

                          alignment: Alignment.center,
                          child: changedButton? Icon(Icons.done,color: Colors.white,):Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18

                            ),
                          ),


                        ),
                      ),
                    )

                    // ElevatedButton(onPressed: (){Navigator.pushNamed(context, myRoutes.homeRoute);}, style: TextButton.styleFrom(
                    //   minimumSize: Size(100,40)
                    // ) ,child: Text("Sign In"))
                  ],
                ),
              )

            ],

          ),
        ),
      )
    );
  }
}
