import { useState } from "react";

export default function DoctorCard(props){
  const [exams, setExams] = useState([])

  async function fetchExams(id){
    const response = await fetch(`http://localhost:3000/api/v1/doctors/${id}/exams`);
    let examList = await response.json();
    if (exams.length == 0) {
      examList = Object.groupBy(examList, ({ token }) => token)
      const organizedList = Object.entries(examList)
      setExams(organizedList)
    }else{
      setExams([])
    }
  }

  return(
    <div className="flex flex-col items-center mt-4 mx-auto border rounded-md w-full bg-white">
      <h3 className="my-1 text-2xl border-b w-full text-center">{props.name}</h3>
      <div className="flex gap-10 mt-5">
        <div className="mb-5">
          <h5 className="text-center text-lg">Email</h5>
          <p>{props.email}</p>
        </div>
        <div>
          <h5 className="text-center text-lg">CRM</h5>
          <p>{props.crm} - {props.crm_state}</p>
        </div>
      </div>
      <button onClick={() => fetchExams(props.id)} className="border-t border-b w-full">
        <h3 className="text-2xl text-center text-blue-500">Exames</h3>
      </button>
      <div>
        {exams.map(exam =>
        <div className="text-center" key={exam[0]}> 
          <h3 className="text-xl">{exam[0]}</h3>
          <div>
            {exam[1].map(examDetails => 
            <div key={examDetails.id}>
              <p>{new Date(examDetails.date).toString()}</p>
              <div>
                <h3 className="text-xl">Tipo do Exame</h3>
                <p>{examDetails.exam_type}</p>
              </div>
              <div className="border-b-2 w-full mb-2">
                <h3 className="text-xl">Limites e Resultado</h3>
                <p>{examDetails.type_limits}</p>
                <p>{examDetails.type_result}</p>
              </div>
            </div>
            )}
          </div>
        </div>
        )}
      </div>
    </div>
  )
}