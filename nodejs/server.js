var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require('ip');

http.createServer(function(req, res){

    if (req.url === "/") {
        fs.readFile("./public/index.html", "UTF-8", function(err, body){
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(body);
    });
    }
    else if(req.url.match("/sysinfo")) {
        myHostName=os.hostname();

        // Retrieved from https://www.geeksforgeeks.org/node-js-os-uptime-method/
        var ut_sec = os.uptime(); 
        var ut_min = ut_sec/60; 
        var ut_hour = ut_min/60; 
          
        ut_sec = Math.floor(ut_sec); 
        ut_min = Math.floor(ut_min); 
        ut_hour = Math.floor(ut_hour); 
          
        ut_hour = ut_hour%60; 
        ut_min = ut_min%60; 
        ut_sec = ut_sec%60;
        
        // Modified from https://stackoverflow.com/a/11832950
        totalmem = Math.round(os.totalmem() / Math.pow(2,30) * 1000) / 1000
        freemem = Math.round(os.freemem() / Math.pow(2,30) * 1000) / 1000
        
        cpucount = os.cpus().length

        html=`    
        <!DOCTYPE html>
        <html>
          <head>
            <title>Node JS Response</title>
          </head>
          <body>
            <p>Hostname: ${myHostName}</p>
            <p>IP: ${ip.address()}</p>
            <p>Server Uptime: ${ut_hour + " hour(s) " + ut_min + " minute(s) " + ut_sec + " second(s)"}</p>
            <p>Total Memory: ${totalmem + "GB(s)"}</p>
            <p>Free Memory: ${freemem + "GB(s)"}</p>
            <p>Number of CPUs: ${cpucount}</p>            
          </body>
        </html>` 
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type": "text/plain"});
        res.end(`404 File Not Found at ${req.url}`);
    }
}).listen(3000);

console.log("Server listening on port 3000");
