const Catering = (props) => {
  return (
      <tr className={'catering-'+props.catering.calories}>
        <td>{props.counter}</td>
        <td>{props.catering.user.firstname}</td>
        <td className="text-center">{props.catering.calories}</td>
        <td>{props.catering.comments}</td>
        <td>
          <a href="#" className="btn btn-sm btn-danger">Zakończ</a>
          <a href="#" className="btn btn-sm btn-success">Szczegóły</a>
        </td>
      </tr>
  )
};

import React from 'react'

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      counter: 0
    }
    this.addOne = this.addOne.bind(this)
  }

  addOne() {
    this.setState({
      counter: this.state.counter + 1
    })
  }

  render() {
    return (
        <div>
        <button
            onClick={ this.addOne }>
          Increment
        </button>
          { this.state.counter }
      </div>
    )
  }
}

export default App