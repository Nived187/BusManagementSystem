
const express = require('express')
const app = express()

app.get('/',(req,res)=>{

    console.log('get inititaed')
    
    res.send('poda')
}).listen(3000);

app.use(express.json());
app.use((req, res,next)=> {

    // Website you wish to allow to connect ---
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});

app.post('/',(req,res)=>{

    console.log('post happened')
    console.log(req.body);
 
    
    res.sendStatus(201)
})