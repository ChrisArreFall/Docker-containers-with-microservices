var express=require('express');
var app=express();
var neo4j = require('node-neo4j'); // there we are importing dependencies
var db = new neo4j("http://neo4j:password@192.168.100.131:7474/") // there you will provide your neo4j host url
require('./router/main')(app,db);  // there we have to pass our database reference in main.js,and rest of lines are same as my previous one

var server=app.listen(3000,function(){
  console.log("Express is running on port 3000");
});