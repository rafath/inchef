class Caterings extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      caterings: this.props.caterings
    }
  }

  render() {
    return (
      <div>
        <h2>Lista cateringów</h2>
        <CateringsList caterings={this.state.caterings} />
      </div>
    )
  }
}