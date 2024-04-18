import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import Doctors from "./pages/Doctors"
import Patients from './pages/Patients';
import ImportExams from './pages/ImportExams';
import Layout from './Layout';
import Exams from './pages/Exams';

const router = createBrowserRouter([{
  path: '/',
  element: <Layout />,
  children: [
    { index: true, element: <Exams />},
    { path: '/doctors', element: <Doctors /> },
    { path: '/patients', element: <Patients />},
    { path: '/import', element: <ImportExams />}
  ]
}])

function App() {
  return (<RouterProvider router={router}/>)
}

export default App
