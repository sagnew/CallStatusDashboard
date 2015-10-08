"use strict";

const twilio = require('twilio');
const client = twilio();
client.makeCall({
  url: '*ngrok url to your /voice route*',
  to: '*your phone number*',
  from: '*your Twilio number*',
  statusCallback: '*ngrok url to your /events route*',
  statusCallbackMethod: 'POST',
  statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
}, (err, call) => {
  if(err) { console.log(err); return err; }
  process.stdout.write(call.sid);
});
