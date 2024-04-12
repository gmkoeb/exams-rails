import { Link, useLocation } from "react-router-dom";

export default function Header(){
  function activeLinkColor(link) {
    const location = useLocation().pathname;
    if (location === link){
      return 'active'
    }else{
      return ''
    }
  }
  return(
    <header className="flex bg-emerald-500 p-4">
      <Link to={'/'} className="text-3xl text-green-100">DoctorCare</Link>
      <nav className="text-xl fw-bold flex items-center ml-24 gap-5">
        <Link className={`${activeLinkColor('/doctors')} hover:text-white`} to={'/doctors'}>Doctors</Link>
        <Link className={`${activeLinkColor('/patients')} hover:text-white`} to={'/patients'}>Patients</Link>
      </nav>
    </header>
  )
}