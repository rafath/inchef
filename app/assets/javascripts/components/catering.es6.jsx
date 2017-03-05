const Catering = ({catering}) => {
  return (
      <div>
        <h4>{catering.calories}</h4>
        <p>{catering.user.email}</p>
      </div>
  )
};