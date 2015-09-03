import express from 'express';
import bodyParser from 'body-parser';

const app = express();

// Run server to listen on port 3000.
const server = app.listen(3000, () => {
  console.log('listening on *:3000');
});

const io = require('socket.io')(server);

app.use(express.static('static'));
app.use(bodyParser.urlencoded({ extended: false } ));

// Set socket.io listeners.
io.on('connection', (socket) => {
  console.log('a user connected');

  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
});

// Set Express routes.
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html');
});

app.post('/events', (req, res) => {
  console.log(req.body);

  let to = req.body.To;
  let from = req.body.From;
  let callStatus = req.body.CallStatus;
  let callSid = req.body.CallSid;

  io.emit('call progress event', { to, from, callStatus, callSid });

  console.log(to, from, callStatus, callSid);
  res.send('Event received');
});
