/*
Sec Info by Alexander Abraham, The Black Unicorn.
Licensed under the MIT license.
*/

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:securitycheck/securitycheck.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Home extends StatefulWidget{
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  String suggestion;
  String secure;
  Color defaultColor;
  String securityScore;
  void initState(){
    suggestion = stdSuggestion;
    secure = noIOMessage;
    defaultColor = mainColor;
    securityScore = (0).toString();
  }
  @override
  Widget build(BuildContext context){
    TextEditingController textController = new TextEditingController();
    String placeHolder = AppLocalizations.of(context).placeHolderLabel;
    String initiate = AppLocalizations.of(context).initateLabel;
    String secureMessage = AppLocalizations.of(context).secureLabel;
    String insecureMessage = AppLocalizations.of(context).insecureLabel;
    String suggestionMessage = AppLocalizations.of(context).suggestionLabel;
    String byMessage = AppLocalizations.of(context).byLabel;
    String licensedMessage = AppLocalizations.of(context).licensedLabel;
    String licenseMessage = AppLocalizations.of(context).licenseLabel;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: accentColor,
        centerTitle: true,
        title: new Text(
          '$appTitle',
          style: new TextStyle(
            color: mainColor,
            fontSize: headingFontSize,
            fontFamily: '$defaultFont'
          )
        )
      ),
      body: new SingleChildScrollView(
        child:new Center(
          child:new Column(
            children: <Widget> [
              new SizedBox(
                height: topSpacingBox
              ),
              new SizedBox(
                width: stdWidth,
                height: inputBoxHeight,
                child: new Padding(
                  padding:EdgeInsets.all(stdPadding),
                  child:new Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [accentColor,tertiaryColor]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(stdRounding)),
                    ),
                    child: new Column(
                        children: <Widget> [
                          new SizedBox(
                            width: inputBoxWidth,
                            height: inputSBoxHeight,
                            child:new Padding(
                              padding: EdgeInsets.all(stdRounding),
                              child:new TextField(
                                controller: textController,
                                decoration: new InputDecoration(
                                  counterText: '',
                                  hintText: '$placeHolder!',
                                  hintStyle: TextStyle(
                                    fontSize: inputSize,
                                    color: mainColor,
                                    fontFamily: '$defaultFont'
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: lineHeight
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: lineHeight
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: specialLineHeight
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: inputSize,
                                  fontFamily: '$defaultFont'
                                )
                              )
                            )
                          ),
                          new Padding(
                            padding:EdgeInsets.all(stdPadding),
                            child: new Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [tertiaryColor,accentColor]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(stdRounding))
                              ),
                              child: new Padding(
                                padding:EdgeInsets.all(specialPadding),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    new Text(
                                      '$securityScore',
                                      style: new TextStyle(
                                        color: defaultColor,
                                        fontSize: stdPadding,
                                        fontFamily: '$defaultFont'
                                      )
                                    ),
                                    new Text(
                                      '$secure',
                                      style: new TextStyle(
                                        color: defaultColor,
                                        fontSize: stdPadding,
                                        fontFamily: '$defaultFont'
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                          ),
                          new Padding(
                            padding:EdgeInsets.all(stdPadding),
                            child:new RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(stdRounding)
                              ),
                              color: mainColor,
                              child: new Padding(
                                padding:EdgeInsets.all(stdPadding),
                                child:new Text(
                                  '$initiate',
                                  style: new TextStyle(
                                    color: accentColor,
                                    fontSize: stdPadding,
                                    fontFamily: '$defaultFont'
                                  )
                                )
                              ),
                              onPressed: () {
                                setState((){
                                  String password = textController.text;
                                  if (password == null){}
                                  else {
                                    securityScore = passwordStrength(password).toString();
                                    if (isSecure(password) == true){
                                      secure = '$secureMessage';
                                      defaultColor = okColor;
                                    }
                                    else {
                                      secure = '$insecureMessage';
                                      suggestion = generatePassword(passWordLength);
                                      defaultColor = notOkColor;
                                    }
                                  }
                                });
                              }
                            )
                          )
                        ]
                      )
                    )
                  )
                ),
                new SizedBox(
                  height: stdPadding
                ),
                new SizedBox(
                  width: stdWidth,
                  height: suggestionBoxNewHeight,
                  child: new Padding(
                    padding: EdgeInsets.all(stdPadding),
                    child:new Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [accentColor, tertiaryColor]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(stdRounding))
                      ),
                      child: new Column(
                        children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(stdPadding),
                          child:new Text(
                            '$suggestionMessage:',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: suggestionLabelSize,
                              fontFamily: '$defaultFont'
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(stdPadding),
                          child:new Text(
                            '$suggestion',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: suggestionResultSize,
                              fontFamily: '$defaultFont'
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              new SizedBox(
                height: stdRounding,
              ),
              new Padding(
                padding: EdgeInsets.all(stdPadding),
                child:new SizedBox(
                height: creditBoxSize,
                width: stdWidth,
                child:new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [accentColor, tertiaryColor]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(stdRounding))
                  ),
                  child: new Column(
                    children: <Widget> [
                      new Padding(
                        padding: EdgeInsets.only(top:stdRounding, bottom:specialPadding),
                        child:new SizedBox(
                          width: pictureSize,
                          height: pictureSize,
                          child:new Image(
                            image: AssetImage(
                              '$logoPath'
                            )
                          ),
                        )
                      ),
                        new SizedBox(
                          height: stdPadding,
                        ),
                        new Padding(
                          padding: EdgeInsets.all(stdPadding),
                          child: new Text(
                            '$appTitle $byMessage $appAuthor, $appAuthorPseudo.\n$licensedMessage $appLicense $licenseMessage.',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: stdPadding,
                              fontFamily: '$defaultFont'
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              new SizedBox(
                height: stdRounding
              )
            ]
          )
        )
      )
    );
  }
}
