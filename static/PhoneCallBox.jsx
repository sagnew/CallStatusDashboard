import React from 'react';
import ReactDOM from 'react-dom';
import PhoneCall from './PhoneCall.jsx';

const socket = io();

class PhoneCallBox extends React.Component {

  constructor() {
    super();
    this.state = {phoneCalls: []}

    // Why do I have to do this binding?
    socket.on('status update', (newCallState) => this._handleStateChange(newCallState));
  }

  _handleStateChange(newCallState) {

    let isNewCall = true;
    let phoneCalls = this.state.phoneCalls.map((call) => {
      if (call.callSid === newCallState.callSid) {
        // This is the updated phone call.
        isNewCall = false;
        return newCallState;
      } else {
        // This is an unchanged phone call.
        return call;
      }
    });

    if(isNewCall) {
      phoneCalls.push(newCallState);
    }

    this.setState({phoneCalls});
  }

  render() {
    console.log(this);
    let phoneCalls = this.state.phoneCalls.map((call) => {
      return <li> <PhoneCall to={call.to} fromNumber={call.fromNumber} callSid={call.callSid} callStatus={call.callStatus}/> </li>
    });

    return (
      <div className="phoneCallBox">
        <h1>Phone calls</h1>
        <div className="phoneCallList">
          {phoneCalls.reverse()}
        </div>
      </div>
    );
  }
}

ReactDOM.render(<PhoneCallBox/>, document.getElementById('phone-calls'));
