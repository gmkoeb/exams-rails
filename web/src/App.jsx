import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import Layout from "./Layout"
import Doctors from "./pages/Doctors"
import Patients from './pages/Patients';
import ImportExams from './pages/ImportExams';

const router = createBrowserRouter([{
  path: '/',
  element: <Layout />,
  children: [
    { path: '/doctors', element: <Doctors /> },
    { path: '/patients', element: <Patients />},
    { path: '/import', element: <ImportExams />}
  ]
}])

function App() {
  return (<RouterProvider router={router}/>)
}

export default App
