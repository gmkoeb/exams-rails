import { useState } from "react";

export default function ImportExams(){
  const [formFile, setFormFile] = useState('Drag and drop a CSV file here or')
  const [importStatus, setImportStatus] = useState('')
  const [jobStatus, setJobStatus] = useState('pending')
  async function handleImport(event){
    event.preventDefault()
    const csvFileInput = document.getElementById('csvImport')
    const formData = new FormData()
    const csvFile = csvFileInput.files[0]
    formData.append('file', csvFile)
    const importResponse = await fetch('http://localhost:3000/api/v1/exams/import', {
      method: 'POST',
      body: formData
    })

    const importData = await importResponse.text();
    const parsedData = JSON.parse(importData)

    setImportStatus(parsedData["message"])
    checkJobStatus(parsedData["token"])
  }

  async function checkJobStatus(token){
    while (true) {
      await new Promise(r => setTimeout(r, 1000))
      const statusResponse = await fetch(`http://localhost:3000/api/v1/exams/import/${token}/status`)
      const statusData = await statusResponse.text()
      const parsedResponse = JSON.parse(statusData)
      if(parsedResponse["status"] === 'done'){
        setJobStatus('done')
        setImportStatus('CSV importation finished with success!')
        break;
      }
    }
  }

  function handleDragover(event){
    event.preventDefault()
  }

  function handleFormChange(event){
    event.preventDefault()
    const fileInput = document.getElementById('csvImport')
    if (event._reactName === 'onDrop'){
      const file = event.dataTransfer.files
      fileInput.files = file
      setFormFile(file[0].name)
    }else{
      setFormFile(fileInput.files[0].name)
    }
  }
  
  function colorBasedOnStatus(){
    if (jobStatus === 'done'){
      return 'text-green-600'
    } else {
      return 'text-yellow-500'
    }
  }
  return (
    <div>
      <form className="flex flex-col w-full gap-5 mx-auto mt-10" method="post" onChange={handleFormChange} onSubmit={handleImport}>
        <p className="text-center" htmlFor="csvImport">Export your exams to our database <span className="text-red-600 text-xs">*extensions supported .csv</span></p>
        <div className="flex justify-center items-center">
          <label onDrop={handleFormChange} onDragOver={handleDragover} id="dropzone" className="w-1/2 h-64 flex border-dashed border-2 justify-center" htmlFor="csvImport">
            <div className="flex justify-center items-center">
              <p className="mx-2">{formFile}</p>
              <label htmlFor="csvImport" className="border bg-emerald-400 p-1 text-white rounded-md">browse</label>
            </div>
          </label>
          <input className="hidden" type="file" id="csvImport" accept="csv"/>
        </div>
        <button type="submit" className="bg-emerald-400 w-1/2 mx-auto rounded-sm p-1 px-6 text-white hover:opacity-90">Send</button>
        <div>
          <p className={`text-center ${colorBasedOnStatus()}`}>{importStatus}</p>
        </div>
      </form>
    </div>
  )
}