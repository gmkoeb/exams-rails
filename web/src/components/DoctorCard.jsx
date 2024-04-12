import { useState } from "react";

export default function DoctorCard(props){
  const [exams, setExams] = useState([])

  async function fetchExams(id){
    const response = await fetch(`http://localhost:3000/api/v1/doctors/${id}/exams`);
    const examList = await response.json();
    setExams(examList);
  }

  return(
    <div className="flex flex-col items-center mt-4 mx-auto border rounded-md w-1/2 bg-white">
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
      <button onClick={() => fetchExams(props.id)} className="border-t w-full">
        <h3 className="text-2xl text-center">Exames</h3>
        {exams.map(exam => exam.token)}
      </button>
    </div>
  )
}