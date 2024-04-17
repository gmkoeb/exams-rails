import { useEffect, useState } from "react"
import PatientCard from "../components/PatientCard"

export default function Patients(){
  const [patients, setPatients] = useState([])
  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch('http://localhost:3000/api/v1/patients')
      const patientsList = await response.json()
      setPatients(patientsList)
    }
    fetchData()
    console.log(patients)
  }, [])
  return(
    <div>
      <h1 className="text-center text-5xl mt-4">Patients List</h1>
      <div className="flex flex-wrap mx-auto gap-5 mt-6">
        {
          patients.map(patient => <PatientCard 
                                    key={patient.id}
                                    id={patient.id}
                                    name={patient.name} 
                                    email={patient.email} 
                                    registrationNumber={patient.registration_number}
                                    birthDate={patient.birth_date}
                                    address={patient.address}
                                    city={patient.city}
                                    state={patient.state}
                                  />)}
      </div>
    </div>
  )
}