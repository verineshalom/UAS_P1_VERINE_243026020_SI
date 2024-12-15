const express = require('express');
const apiArtist = require('./routes/artist.js');
const apiGenre = require ('./routes/genre.js');
const apiAlbum = require ('./routes/album.js');
const apiLagu = require ('./routes/lagu.js');

const app = express()
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use('/artist', apiArtist)
app.use('/genre', apiGenre)
app.use('/album',apiAlbum)
app.use('/lagu', apiLagu)


const port = 3000;
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
