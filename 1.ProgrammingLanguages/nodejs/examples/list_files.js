//requiring path and fs modules
const path = require('path');
const fs = require('fs');
//joining path of directory 
//const directoryPath = path.join(__dirname, 'Documents');
// This is for a specific PATH and not the actual directory work + Documents
const directoryPath = path.join( '/Users/lgtoroe/Documents');
//passsing directoryPath and callback function
//passsing directoryPath and callback function
fs.readdir(directoryPath, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    } 
    //listing all files using forEach
    files.forEach(function (file) {
        // Do whatever you want to do with the file
        console.log(file); 
    });
});