const CateringsList = ({caterings}) =>
  <div>{caterings.map((catering) => {
    return (<Catering key={catering.id} catering={catering}/>);
  })}
  </div>;