import 'twilio';
let client = Twilio();

client.makeCall({
  url: 'http://gnarly.io/voice.xml',
  to: '+16107616189',
  from: '+15517774733',
  statusCallback: 'http://sagnew.ngrok.io/events',
  statusCallbackMethod: 'POST',
  statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
}, (err, call) => {
  if(err) { console.log(err); return err; }
  process.stdout.write(call.sid);
});
