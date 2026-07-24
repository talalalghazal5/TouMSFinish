import { login, authHeaders, getToken } from "./auth";
import type { BookingStats, SalesDataPoint } from "@/types";

const API_BASE = "http://127.0.0.1:8000/api";

async function fetchWithAuth(url: string): Promise<Response> {
  if (!getToken()) await login();
  const res = await fetch(url, { headers: authHeaders() });
  if (res.status === 401) {
    await login();
    return fetch(url, { headers: authHeaders() });
  }
  return res;
}

export async function getBookingStats(): Promise<BookingStats> {
  const [flightsRes, toursRes] = await Promise.allSettled([
    fetchWithAuth(`${API_BASE}/booking/flights`),  // bookings الـ flights
    fetchWithAuth(`${API_BASE}/tours`),             // كل الـ tours
  ]);

  let total = 0;
  let pending = 0;
  let cancelled = 0;

  for (const result of [flightsRes, toursRes]) {
    if (result.status === "fulfilled" && result.value.ok) {
      const data = await result.value.json();
      const items = Array.isArray(data) ? data : data.data ?? [];
      total += items.length;
      pending += items.filter(
        (b: { bookingStatus?: string; status?: string }) =>
          b.bookingStatus === "pending" || b.status === "pending"
      ).length;
      cancelled += items.filter(
        (b: { bookingStatus?: string; status?: string }) =>
          b.bookingStatus === "cancelled" || b.status === "cancelled"
      ).length;
    }
  }

  return {
    totalBookings: total,
    pendingRequests: pending,
    cancelledBookings: cancelled,
  };
}

export async function getSalesData(_month: string): Promise<SalesDataPoint[]> {
  const res = await fetchWithAuth(`${API_BASE}/tours`);
  const data = res.ok ? await res.json() : [];
  const items = Array.isArray(data) ? data : data.data ?? [];

  if (items.length === 0) {
    return Array.from({ length: 10 }, (_, i) => ({
      value: (i + 1) * 5000,
      percentage: Math.floor(Math.random() * 60) + 20,
    }));
  }

  return items.slice(0, 10).map((_: unknown, i: number) => ({
    value: (i + 1) * 5000,
    percentage: Math.floor(Math.random() * 60) + 20,
  }));
}

export async function getHotels() { return []; }
export async function getBookings() { return []; }