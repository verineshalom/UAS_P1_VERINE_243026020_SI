const express = require('express')
const router = express.Router()
const db = require('../database')


//Read
router.get('/', (req, res) => {
    const sql = 'SELECT * FROM lagu';
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})

//Create
router.post('/', (req, res) => {
    const data = {
        id_lagu: req.body.id_lagu,
        id_album: req.body.id_album,
        id_artist: req.body.id_artist,
        judul_lagu: req.body.judul_lagu,
    }
    const sql  = 'INSERT INTO lagu SET ?';
    db.query(sql, data, (err, result) => {
        if (err != null) {
            if (err.errno == 1062) {
                return res.status(200).json({
                    status: 200,
                    message: 'Duplicate id. Insert aborted'
                })
            } else {
                return res.json({
                    status: 500,
                    message: err.message
                })
            }
        }
        res.status(201).json({
            status: 200,
            message: 'Data has been saved',
            data: data
        })
    })
})

// Update
router.put ('/:id', (req, res) => {
    const data = {
        id_album: req.body.id_album,
        id_artist: req.body.id_artist,
        judul_lagu: req.body.judul_lagu,
    }
    const sql = 'UPDATE lagu SET ? WHERE id_lagu = ?'
    db.query(sql, [data, req.params.id], (err, result) => {
        if (err) {
            return res.json({
                status: 401,
                message: err.message
            })
        }
        res.status(200).json({
            status: 200,
            message: 'Update successfully',
            data: data
        })
    })
})

//Delete
router.delete('/:id', (req,res) => {
    const sql = 'DELETE FROM lagu WHERE id_lagu = ?'
    db.query(sql, req.params.id, (err, result) => {
        if (err) {
            return res.json ({
                status : 500,
                message : err.message
            })
        }
        res.status(202).json({
            status : 200,
            message : 'Deleted'
        })
    })
})

module.exports = router
