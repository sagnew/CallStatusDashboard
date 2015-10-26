"use strict";

const twilio = require('twilio');
const client = twilio();

client.makeCall({
  url: '',
  to: '',
  from: '',
  statusCallback: '',
  statusCallbackMethod: 'POST',
  statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
}, (err, call) => {
  if(err) { console.log(err); return err; }
  process.stdout.write(call.sid);
});
