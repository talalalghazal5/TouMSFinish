"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  LayoutDashboard,
  Hotel,
  CalendarCheck,
  Mail,
  Tickets,
  LineChart,
} from "lucide-react";
import { cn } from "@/lib/utils";

const navItems = [
  { label: "Overview", href: "/overview", icon: LineChart },
  { label: "Hotels", href: "/hotels", icon: Hotel },
  { label: "Bookings", href: "/bookings", icon:CalendarCheck },
  { label: "Mail", href: "/mail", icon: Mail },
];

export function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-56 min-h-screen bg-white border-r border-gray-100 flex flex-col py-6 px-3 shrink-0">
      <div className="mb-8 px-3">
        <span className="text-2xl font-bold tracking-tight text-gray-900">
          Touris<span className="text-blue-500">mo</span>
        </span>
      </div>
      <nav className="flex flex-col gap-1">
        {navItems.map(({ label, href, icon: Icon }) => {
          const isActive = pathname === href || pathname.startsWith(href);
          return (
            <Link
              key={href}
              href={href}
              className={cn(
                "flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-150",
                isActive
                  ? "bg-blue-50 text-blue-600"
                  : "text-gray-500 hover:bg-gray-50 hover:text-gray-800"
              )}
            >
              <Icon
                size={18}
                className={cn(isActive ? "text-blue-500" : "text-gray-400")}
              />
              {label}
            </Link>
          );
        })}
      </nav>
    </aside>
  );
}