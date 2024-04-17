export default function ExamCard(props){
  return(
    <div className="text-center"> 
      <div> 
        <div>
          <p>{new Date(props.date).toString()}</p>
          <div>
            <h3 className="text-xl text-green-500 ">Tipo do Exame</h3>
            <p>{props.examType}</p>
          </div>
          <div className="border-b-2 w-full mb-2">
            <h3 className="text-xl text-green-500">Limites e Resultado</h3>
            <p>{props.typeLimits}</p>
            <p>{props.typeResult}</p>
          </div>
        </div>
      </div>
    </div>
  )
}