import { useState } from "react";
import ExamCard from "./ExamCard";

export default function PatientCard(props){
  const [exams, setExams] = useState([])
  async function fetchExams(id){
    const response = await fetch(`http://localhost:3000/api/v1/patients/${id}/exams`)
    let examList = await response.json()
    if (exams.length === 0){
      examList = Object.groupBy(examList, ({ token }) => token)
      const organizedList = Object.entries(examList)
      setExams(organizedList)
    } else{
      setExams([])
    }
  }
  return(
    <div className="flex flex-col items-center mt-4 mx-auto border rounded-md w-1/2 bg-white">
      <h3 className="my-1 text-2xl border-b w-full text-center font-semibold">{props.name}</h3>
      <div className="flex flex-col mt-2 text-center">
        <div className="mb-1">
          <h3 className="text-center text-xl text-blue-500">Email</h3>
          <p>{props.email}</p>
        </div>
        <div>
          <h3 className="text-xl text-blue-500">Additional Info</h3>
          <div>
            <h3>Registration Number</h3>
            <p>{props.registrationNumber}</p>
          </div>
          <div className="text-xl">
            <h3 className="text-blue-500">Birth Date</h3>
            <p>{props.birthDate}</p>
          </div>
        </div>
        <div>
          <h3 className="text-xl text-blue-500">Location</h3>
          <div>
            <p>{props.address} - {props.city}, {props.state}</p>
          </div>
        </div>
      </div>
      <div className="border-t w-full text-center mt-5">
        <button onClick={() => fetchExams(props.id)} className="border-t border-b w-full">
          <h3 className="text-2xl text-center text-blue-500">Exames</h3>
        </button>
      </div>
      <div>
        {exams.map(exam => (
          <div key={exam[0]}>
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