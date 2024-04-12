import { useEffect, useState } from "react"
import DoctorCard from "../components/DoctorCard"

export default function Doctors(){
  const [doctors, setDoctors] = useState([])
  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch('http://localhost:3000/api/v1/doctors')
      const doctorsList = await response.json()
      setDoctors(doctorsList)
    }
    fetchData()
  }, [])
  
  return(
    <div>
      <h1 className="text-center text-5xl mt-4">Doctors List</h1>
      <div className="flex flex-wrap w-1/2 mx-auto gap-5 mt-6">
        {
          doctors.map(doctor => <DoctorCard 
                                  key={doctor.id}
                                  id={doctor.id}
                                  name={doctor.name} 
                                  email={doctor.email} 
                                  crm={doctor.crm}
                                  crm_state={doctor.crm_state}
                                />)}
      </div>
    </div>
  )
}