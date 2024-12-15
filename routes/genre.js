const express = require('express')
const router = express.Router()
const db = require('../database')


//Read
router.get('/', (req, res) => {
    const sql = 'SELECT * FROM genre';
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result)
    })
})

//Create
router.post('/', (req, res) => {
    const data = {
        id_genre: req.body.id_genre,
        genre: req.body.genre,
    }
    const sql  = 'INSERT INTO genre SET ?';
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
        genre: req.body.genre,
    }
    const sql = 'UPDATE genre SET ? WHERE id_genre = ?'
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
    const sql = 'DELETE FROM genre WHERE id_genre = ?'
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
