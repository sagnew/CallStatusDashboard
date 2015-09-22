import React from 'react';

class PhoneCall extends React.Component {
  render() {
    return (
      <div className="phone-call">
        <h4 className="call-SID">
          {"Call SID: " + this.props.callSid}
        </h4>
        <h4 className="to-number">
          {"To: " + this.props.to}
        </h4>
        <h4 className="from-number">
          {"From: " + this.props.fromNumber}
        </h4>
        <h4 className="date_updated">
          {"Call Status: " + this.props.callStatus}
        </h4>
      </div>
    );
  }
};

export default PhoneCall;
