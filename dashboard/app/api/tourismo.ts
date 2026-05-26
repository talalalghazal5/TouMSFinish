import type { BookingStats, SalesDataPoint, Hotel, Booking } from "@/types";

// Simulated delay like a real API
const delay = (ms: number) => new Promise((res) => setTimeout(res, ms));

export async function getBookingStats(): Promise<BookingStats> {
  await delay(300);
  return {
    totalBookings: 40000,
    pendingRequests: 500,
    cancelledBookings: 150,
  };
}

export async function getSalesData(month: string): Promise<SalesDataPoint[]> {
  await delay(300);
  const data: Record<string, SalesDataPoint[]> = {
    October: [
      { value: 5000, percentage: 20 },
      { value: 10000, percentage: 40 },
      { value: 15000, percentage: 70 },
      { value: 18000, percentage: 95 },
      { value: 20000, percentage: 30 },
      { value: 22000, percentage: 55 },
      { value: 25000, percentage: 93 },
      { value: 27000, percentage: 70 },
      { value: 28000, percentage: 80 },
      { value: 30000, percentage: 40 },
      { value: 32000, percentage: 67 },
      { value: 33000, percentage: 75 },
      { value: 35000, percentage: 52 },
      { value: 37000, percentage: 80 },
      { value: 38000, percentage: 60 },
      { value: 40000, percentage: 42 },
      { value: 42000, percentage: 80 },
      { value: 44000, percentage: 60 },
      { value: 46000, percentage: 78 },
      { value: 48000, percentage: 58 },
      { value: 50000, percentage: 80 },
    ],
    November: [
      { value: 5000, percentage: 30 },
      { value: 10000, percentage: 50 },
      { value: 15000, percentage: 60 },
      { value: 18000, percentage: 85 },
      { value: 20000, percentage: 40 },
      { value: 22000, percentage: 65 },
      { value: 25000, percentage: 75 },
      { value: 27000, percentage: 55 },
      { value: 28000, percentage: 70 },
      { value: 30000, percentage: 50 },
      { value: 32000, percentage: 80 },
      { value: 33000, percentage: 65 },
      { value: 35000, percentage: 45 },
      { value: 37000, percentage: 70 },
      { value: 38000, percentage: 55 },
      { value: 40000, percentage: 62 },
      { value: 42000, percentage: 72 },
      { value: 44000, percentage: 50 },
      { value: 46000, percentage: 68 },
      { value: 48000, percentage: 48 },
      { value: 50000, percentage: 70 },
    ],
    September: [
      { value: 5000, percentage: 25 },
      { value: 10000, percentage: 45 },
      { value: 15000, percentage: 65 },
      { value: 18000, percentage: 90 },
      { value: 20000, percentage: 35 },
      { value: 22000, percentage: 60 },
      { value: 25000, percentage: 88 },
      { value: 27000, percentage: 65 },
      { value: 28000, percentage: 75 },
      { value: 30000, percentage: 45 },
      { value: 32000, percentage: 72 },
      { value: 33000, percentage: 80 },
      { value: 35000, percentage: 57 },
      { value: 37000, percentage: 85 },
      { value: 38000, percentage: 65 },
      { value: 40000, percentage: 47 },
      { value: 42000, percentage: 75 },
      { value: 44000, percentage: 55 },
      { value: 46000, percentage: 73 },
      { value: 48000, percentage: 53 },
      { value: 50000, percentage: 75 },
    ],
  };
  return data[month] ?? data["October"];
}

export async function getHotels(): Promise<Hotel[]> {
  await delay(300);
  return [
    { id: "1", name: "Grand Palace Hotel", location: "Paris, France", price: 320, rating: 4.8 },
    { id: "2", name: "Ocean Breeze Resort", location: "Maldives", price: 580, rating: 4.9 },
    { id: "3", name: "Mountain View Lodge", location: "Swiss Alps", price: 210, rating: 4.6 },
    { id: "4", name: "City Center Suites", location: "New York, USA", price: 450, rating: 4.7 },
    { id: "5", name: "Desert Oasis Hotel", location: "Dubai, UAE", price: 390, rating: 4.8 },
    { id: "6", name: "Tropical Paradise Inn", location: "Bali, Indonesia", price: 175, rating: 4.5 },
  ];
}

export async function getBookings(): Promise<Booking[]> {
  await delay(300);
  return [
    { id: "B001", hotelName: "Grand Palace Hotel", guestName: "Alice Johnson", checkIn: "2024-10-15", checkOut: "2024-10-20", status: "confirmed", amount: 1600 },
    { id: "B002", hotelName: "Ocean Breeze Resort", guestName: "Bob Smith", checkIn: "2024-10-18", checkOut: "2024-10-25", status: "pending", amount: 4060 },
    { id: "B003", hotelName: "Mountain View Lodge", guestName: "Carol White", checkIn: "2024-10-22", checkOut: "2024-10-26", status: "confirmed", amount: 840 },
    { id: "B004", hotelName: "City Center Suites", guestName: "David Brown", checkIn: "2024-10-10", checkOut: "2024-10-12", status: "cancelled", amount: 900 },
    { id: "B005", hotelName: "Desert Oasis Hotel", guestName: "Emma Davis", checkIn: "2024-11-01", checkOut: "2024-11-05", status: "pending", amount: 1560 },
    { id: "B006", hotelName: "Tropical Paradise Inn", guestName: "Frank Wilson", checkIn: "2024-11-10", checkOut: "2024-11-17", status: "confirmed", amount: 1225 },
  ];
}