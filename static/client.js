const socket = io();

socket.on('status update', (callState) => {
  console.log(callState);
});
