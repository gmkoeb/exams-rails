export default function PatientCard(props){
  return(
    <div className="flex flex-col items-center mt-4 mx-auto border rounded-md w-1/2 bg-white">
      <h3 className="my-1 text-2xl border-b w-full text-center">{props.name}</h3>
      <div className="flex flex-col mt-2 text-center">
        <div className="mb-1">
          <h5 className="text-center text-xl">Email</h5>
          <p>{props.email}</p>
        </div>
        <div>
          <h5 className="text-xl my-1">Additional Info</h5>
          <div>
            <h3>Registration Number</h3>
            <p>{props.registrationNumber}</p>
          </div>
          <div className="mt-1">
            <h3>Birth Date</h3>
            <p>{props.birthDate}</p>
          </div>
        </div>
        <div>
          <h5 className="text-xl my-1">Location</h5>
          <div>
            <p>{props.address} - {props.city}, {props.state}</p>
          </div>
        </div>
      </div>
      <div className="border-t w-full">
        <h3 className="text-2xl text-center">Exames</h3>
      </div>
    </div>
  )
}