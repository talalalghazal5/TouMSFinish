export interface BookingStats {
  totalBookings: number;
  pendingRequests: number;
  cancelledBookings: number;
}

export interface SalesDataPoint {
  value: number;
  percentage: number;
}

export interface NavItem {
  label: string;
  href: string;
  icon: string;
}

export interface Hotel {
  id: string;
  name: string;
  location: string;
  price: number;
  rating: number;
  image?: string;
}

export interface Booking {
  id: string;
  hotelName: string;
  guestName: string;
  checkIn: string;
  checkOut: string;
  status: "confirmed" | "pending" | "cancelled";
  amount: number;
}