var socket = io();

socket.on('call progress event', function(call){
  // Create a list item to add to the page.
  var li = document.createElement('li');

  // Create an element for each piece of data in the phone call object.
  var callSid = document.createElement('h4');
  var to = document.createElement('h4');
  var fromNumber = document.createElement('h4');
  var callStatus = document.createElement('h4');

  // Set the display text for each element.
  callSid.textContent = 'Call SID: ' + call.callSid;
  to.textContent = 'To: ' + call.to;
  fromNumber.textContent = 'From: ' + call.fromNumber;
  callStatus.textContent = 'Call Status: ' + call.callStatus;

  // Append each line of text to our phone call list item.
  li.appendChild(callSid);
  li.appendChild(to);
  li.appendChild(fromNumber);
  li.appendChild(callStatus);

  // Append the new object to the #phone-calls div.
  document.getElementById('phone-calls').appendChild(li);
});
