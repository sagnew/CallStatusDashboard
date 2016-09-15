"use strict";

const twilio = require('twilio');
const client = twilio();

client.makeCall({
  url: 'http://YOUR_NGROK_URL/voice',
  to: 'YOUR_PHONE_NUMBER',
  from: 'YOUR_TWILIO_PHONE_NUMBER',
  statusCallback: 'http://YOUR_NGROK_URL/events',
  statusCallbackMethod: 'POST',
  statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
}, (err, call) => {
  if(err) { console.log(err); return err; }
  process.stdout.write(call.sid);
});
