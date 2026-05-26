"use client";

import { Users, RefreshCw, XCircle } from "lucide-react";
import { StatCard } from "@/components/overview/StatCard";
import { SalesChart } from "@/components/overview/SalesChart";
import { useBookingStats } from "@/hooks/useBookingStats";

export default function OverviewPage() {
  const { stats, loading } = useBookingStats();

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-gray-900">Overview</h1>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <StatCard
          title="Total Bookings"
          value={stats?.totalBookings ?? 0}
          icon={<Users size={20} className="text-blue-500" />}
          iconBg="bg-blue-50"
          loading={loading}
        />
        <StatCard
          title="Pending Requests"
          value={stats?.pendingRequests ?? 0}
          icon={<RefreshCw size={20} className="text-emerald-500" />}
          iconBg="bg-emerald-50"
          loading={loading}
        />
        <StatCard
          title="Cancelled Bookings"
          value={stats?.cancelledBookings ?? 0}
          icon={<XCircle size={20} className="text-red-400" />}
          iconBg="bg-red-50"
          loading={loading}
        />
      </div>

      <SalesChart />
    </div>
  );
}