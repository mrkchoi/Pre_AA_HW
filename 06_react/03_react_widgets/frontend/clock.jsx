import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.handle = null;
  }

  componentDidMount() {
    this.handle = setInterval(() => {
      this.tick();
    }, 1000);
  }

  componentWillUnmount() {
    this.removeClock();
  }

  tick() {
    this.setState({
      time: new Date()
    });
  }

  removeClock() {
    clearInterval(this.handle);
  }
  

  render() {
    return (
      <div>
        <h1>React Clock</h1>
        <div className="clock_main">
          <div className="clock_time">
            <p>Time:</p>
            <p>{(this.state.time).toLocaleTimeString()}</p>
          </div>
          <div className="clock_date">
            <p>Date:</p>
            <p>{(this.state.time).toDateString()}</p>
          </div>
        </div>
      </div>
    )
  }
}

export default Clock;
