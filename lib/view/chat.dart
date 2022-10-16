//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaChat extends StatefulWidget {
  const TelaChat({Key? key}) : super(key: key);

  @override
  State<TelaChat> createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: ClipOval(
                  child:
                      Image.asset('lib/images/diego.jpeg', fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Diego',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.73,
                color: Colors.white,
                //margin: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        //color: Colors.transparent,
                        // child: ListView.builder(itemBuilder: itemBuilder),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('lib/images/chat.png'))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 110),
                              child: TextFormField(
                                maxLines: null,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide:
                                            BorderSide(color: Colors.black87)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide:
                                            BorderSide(color: Colors.black87)),
                                    prefixIcon: Icon(Icons.emoji_emotions,
                                        color: Colors.black),
                                    hintText: 'Mensagem',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      onPressed: (() {}),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 168, 67),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.mic,
                                      size: 34,
                                    ),
                                    onPressed: () {},
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
