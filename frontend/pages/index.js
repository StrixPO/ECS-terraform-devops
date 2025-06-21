import { useEffect, useState } from "react";

const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";

export default function Home() {
  const [msg, setMsg] = useState("");

  useEffect(() => {
    fetch(`${API_URL}/api/message`)
      .then((res) => res.json())
      .then((data) => setMsg(data.message));
  }, []);

  return <h1>{msg || "Loading .."}</h1>;
}
