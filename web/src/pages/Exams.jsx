import { useEffect, useState } from "react";
import ExamCard from "../components/ExamCard";

export default function Exams(){
  const [exams, setExams] = useState([])
  const [filteredExams, setFilteredExams] = useState([])
  const [open, setOpen] = useState(false)
  const [index, setIndex] = useState('')
  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch('http://localhost:3000/api/v1/exams') 
      let examList = await response.json()
      examList = Object.groupBy(examList, ({ token }) => token)
      const organizedList = Object.entries(examList)
      setExams(organizedList)
      setFilteredExams(organizedList)
    }
    fetchData()
  }, [])

  function Collapse(event){
    setIndex(event.target.innerHTML)
    setOpen((currentValue) => !currentValue)
  }

  function filterExams(event){
    const filterParams = event.target.value
    setExams(() => filteredExams.filter((exam => exam[0].toLowerCase().includes(filterParams.toLowerCase()))))
  } 
  return(
    <div className="flex flex-col items-center">
      <h1 className="text-5xl text-center mb-5">Exams</h1>
      <div className="w-1/4">
        <label htmlFor="searchInput">Search for your exam token</label>
        <input id="searchInput" type="text" onInput={filterExams} className="border w-full p-1" />
      </div>
      <div className="flex flex-wrap">
        {exams.map(exam => (
          <div key={exam[0]}>
            <h3 onClick={Collapse} className="text-2xl font-bold text-blue-500 underline mt-2 text-center w-fit mx-auto hover: cursor-pointer">{exam[0]}</h3>
            <div className="flex flex-wrap justify-center gap-5">
              {exam[1].map(details => (
                <div key={details.id} className={`exam-cards ${open && index === details.token ? '' : 'collapsed'}`}>
                  {open && index === details.token &&
                    <div className={`bg-white p-5 border rounded-lg`}>
                      <ExamCard 
                        date={details.date}
                        examType={details.exam_type}
                        typeLimits={details.type_limits}
                        typeResult={details.type_result}/>
                    </div>
                  }
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}