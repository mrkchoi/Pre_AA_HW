import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    };
  }

  setNum1(e) {
    e.preventDefault();
    let num1 = parseInt(e.target.value);
    this.setState({ num1 });
  }

  setNum2(e) {
    e.preventDefault();
    let num2 = parseInt(e.target.value);
    this.setState({ num2 });
  }

  clearInputs(e) {
    e.preventDefault();
    this.setState({
      result: 0,
      num1: '',
      num2: ''
    });
  }

  add() {
    let result = this.state.num1 + this.state.num2;
    console.log(result);
    this.setState({ result });
  }

  subtract() {
    let result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  multiply() {
    let result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  divide() {
    let result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }

  render() {
    let { result, num1, num2 } = this.state;

    return (
      <div>
        <h1>{result}</h1>
        <br/>
        <div>
          <input 
            type="text" 
            onChange={this.setNum1.bind(this)} 
            value={num1}/>
          <input
            type="text"
            onChange={this.setNum2.bind(this)}
            value={num2} />
            <button onClick={this.clearInputs.bind(this)}>Clear</button>
            <br/>

            <button onClick={this.add.bind(this)}>+</button>
            <button onClick={this.subtract.bind(this)}>-</button>
            <button onClick={this.multiply.bind(this)}>*</button>
            <button onClick={this.divide.bind(this)}>/</button>
        </div>
      </div>
    );
  }
}

export default Calculator;
