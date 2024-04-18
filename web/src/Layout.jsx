import { Outlet } from "react-router-dom";
import Header from "./components/Header";
import Exams from "./pages/Exams";

export default function Layout(){
  return <>
    <Header/>
    <main>
      <Outlet />
    </main>
  </>
}