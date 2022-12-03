var express = require('express');
var router = express.Router();
const { v4 : uuidv4 } = require('uuid'); //import uuid

// Panggil Model Soal
var Soal = require('../models/soal');

/* TAMPIL DATA */
router.get('/', function(req, res, next) {
       Soal.findAll().then( data => {
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

/* TAMBAH DATA */
router.post('/', function(req, res, next) {
       req.body.id = uuidv4(); //mengisi nilai id dengan UUID
       Soal.create(req.body).then( data => {
              res.json({
                     status:true,
                     pesan:"Data BERHASIL Ditambahkan",
                     data:data
              });
       }).catch(err => {
              res.json({
                     status:false,
                     pesan:"Data GAGAL Ditambahkan : " + err.message,
                     data:[]
              });
       });
});

/* UBAH DATA */
router.put('/', function(req, res, next) {
       Soal.update(req.body, {
              where:{nim:req.body.nim}
       }).then( () => {
              res.json({
                     status:true,
                     pesan:"Data BERHASIL Diubah",
                     data: []
              });
       }).catch(err => {
              res.json({
                     status:false,
                     pesan:"Data GAGAL Diubah : " + err.message,
                     data:[]
              });
       });
});

/* HAPUS DATA */
router.delete('/', function(req, res, next) {
       Soal.destroy({
              where:{nim:req.body.nim}
       }).then( () => {
              res.json({
                     status:true,
                     pesan:"Data BERHASIL Dihapus",
                     data: []
              });
       }).catch(err => {
              res.json({
                     status:false,
                     pesan:"Data GAGAL Dihapus : " + err.message,
                     data:[]
              });
       });
});

module.exports = router;