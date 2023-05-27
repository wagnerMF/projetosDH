const indexControler = require("./delivery_pi/controllers/indexControlers")
const criarconta = require("./delivery_pi/controllers/criarconta")
const autenticacao = require("./delivery_pi/controllers/autenticacao")

const path=require('path');

const express = require('express');
const api = express();

api.use(express.static('./delivery_pi/public_html'));
api.set('views',path.join(__dirname,'delivery_pi/views'));
api.set('view engine','ejs');

api.get('/',indexControler);
api.get('/adm',criarconta);
api.get('/login',autenticacao);

api.listen('4444', () => console.log ('servidor no ar'));