const express = require('express');
const app = exoress();

app.get('/', (req, res) => {
  res.send('Hello from CodeDeploy + Docker!');
});

app.listen(3000, () => console.log('App running on port 3000'));
