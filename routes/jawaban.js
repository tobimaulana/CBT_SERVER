var express = require('express');
var router = express.Router();

// import middleware_app
var appToken = require("../middleware_app");

//panggil Model soal & jawaban
var Soal = require('../models/soal');
var Jawaban = require('../models/jawaban');

/* TAMPIL DATA */
router.get('/', function(req, res, next) {
       Jawaban.findAll().then( data => {
              res.json({
                     status:true,
                     pesan:"Data BERHASIL Tampil",
                     data:data
              });
       }).catch(err => {
              res.json({
                     status:false,
              });
       });
});

/* Menerima data dari project CBT untuk diupdate di TABEL JAWABAN*/
router.post('/sync', async function(req, res, next) {
       // Koreksi Jawaban
       var jawaban = [];
       for (var itemJawaban of req.body){
              var soal = await Soal.findByPk(itemJawaban.soal_id);
              if(soal.kunci == itemJawaban.jawaban) {
                     itemJawaban.koreksi = 1;
              } else {
                     itemJawaban.koreksi = 0;
              }
              jawaban.push(itemJawaban);
       }

       Jawaban.bulkCreate(jawaban, {
              updateOnDuplicate: ["jawaban","koreksi"]
       }).then (data => {
              res.json({
                     status:true,
                     pesan:"Berhasil Tersinkronisasi",
                     data:data
              });
       })
       .catch(err => {
              res.json({
                     status:false,
                     pesan:"Gagal Tersinkronisasi : " + err.message,
                     data:[]
              });
       });
});


router.get('/validasi/:id/:nis', appToken, function(req,res,next){
       var id = req.params.id; 
       var nis = req.params.nis; 
       Jawaban.findAll({ 
              where:{ 
                     id:id,  
                     nis:nis,  
              } 
       })
       .then( data => {      
              res.json({   
                     status:true,   
                     pesan:"Berhasil Tampil",   
                     data:data     
              });       
       })
       .catch( err => {      
              res.json({        
                     status: false,     
                     pesan: "Gagal tampil: " + err.message,      
                     data:[]        
              });        
       });     
});




module.exports = router;