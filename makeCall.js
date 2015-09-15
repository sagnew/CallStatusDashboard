"use strict";

const twilio = require('twilio');
const client = twilio();

client.makeCall({
  url: 'http://sagnew.ngrok.io/voice',
  to: '+16107616189',
  from: '+16092514693',
  statusCallback: 'http://sagnew.ngrok.io/events',
  statusCallbackMethod: 'POST',
  statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
}, (err, call) => {
  if(err) { console.log(err); return err; }
  process.stdout.write(call.sid);
});
