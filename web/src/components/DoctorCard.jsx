import { useState } from "react";
import ExamCard from "./ExamCard";

export default function DoctorCard(props){
  const [exams, setExams] = useState([])

  async function fetchExams(id){
    const response = await fetch(`http://localhost:3000/api/v1/doctors/${id}/exams`)
    let examList = await response.json()
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
      <h3 className="my-1 text-2xl border-b w-full text-center font-semibold">{props.name}</h3>
      <div className="flex gap-10 mt-5">
        <div className="mb-5">
          <h5 className="text-center text-lg text-blue-500">Email</h5>
          <p>{props.email}</p>
        </div>
        <div>
          <h5 className="text-center text-lg text-blue-500">CRM</h5>
          <p>{props.crm} - {props.crm_state}</p>
        </div>
      </div>
      <button onClick={() => fetchExams(props.id)} className="border-t border-b w-full">
        <h3 className="text-2xl text-center text-blue-500">Exames</h3>
      </button>
      <div>
        {exams.map(exam => (
          <div className="exam-cards" key={exam[0]}>
            <h3 className="text-center text-2xl font-bold text-green-500 mt-2">{exam[0]}</h3>
            {exam[1].map(examDetails => (
                <ExamCard 
                  key={examDetails.id}
                  date={examDetails.date}
                  examType={examDetails.exam_type}
                  typeLimits={examDetails.type_limits}
                  typeResult={examDetails.type_result}
                />  
            ))}
          </div>
        ))}
      </div>
    </div>
  )
}