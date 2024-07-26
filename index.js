const app = require('express')();

app.get('/', (req, res) => {
  res.json( 'Hello World! - Docker Container' );
});

const port = process.env.PORT || 8080


app.listen(port, () => console.log(`app listening on http://localhost:${port}`))

// http://localhost:8080/
