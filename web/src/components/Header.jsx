import { Link } from "react-router-dom";

export default function Header(){
  return(
    <header className="flex bg-emerald-500 p-4">
      <Link to={'/'} className="text-3xl text-green-100">DoctorCare</Link>
      <nav className="flex items-center ml-24 gap-5">
        <Link to={'/doctors'}>Doctors</Link>
        <Link to={'/patients'}>Patients</Link>
      </nav>
    </header>
  )
}