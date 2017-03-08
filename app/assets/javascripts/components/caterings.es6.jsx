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
        <table className="table table-bordered table-hover table-sm">
          <thead className="thead-inverse">
          <tr>
            <th>L.p.</th>
            <th>Odbiorca</th>
            <th>Kaloryczność</th>
            <th>Uwagi</th>
            <th>Opcje</th>
          </tr>
          </thead>
          <CateringsList caterings={this.state.caterings} />
          </table>
      </div>
    )
  }
}