var old_calories = 0;
const CateringsList = ({caterings}) =>
  <tbody>
  {caterings.map((catering) => {
    if (old_calories != catering.calories) {
      old_calories = catering.calories;
      counter = 0
    } 
    counter += 1;
    old_calories = catering.calories;
    return (<Catering key={catering.id} counter={counter} catering={catering}/>);
  })}
  </tbody>;