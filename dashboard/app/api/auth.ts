const API_BASE = "http://127.0.0.1:8000/api";

export async function login(): Promise<string> {
  const formData = new FormData();
  formData.append("email", "dohaalarbeed4@gmail.com");
  formData.append("password", "20042004");

  const res = await fetch(`${API_BASE}/login`, {
    method: "POST",
    headers: { Accept: "application/json" },
    body: formData,
  });

  if (!res.ok) throw new Error("Login failed");
  const data = await res.json();

  // الباك بيرجع "Token:" بنقطتين ومسافة
  const token = data["Token:"] ?? data.token ?? data.access_token;

  if (!token) throw new Error("No token in response");
  localStorage.setItem("token", token);
  return token;
}

export function getToken(): string {
  return localStorage.getItem("token") ?? "";
}

export function authHeaders() {
  return {
    Accept: "application/json",
    Authorization: `Bearer ${getToken()}`,
  };
}