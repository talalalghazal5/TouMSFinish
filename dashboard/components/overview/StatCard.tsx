import { ReactNode } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";
import { cn } from "@/lib/utils";

interface StatCardProps {
  title: string;
  value: string | number;
  icon: ReactNode;
  iconBg?: string;
  loading?: boolean;
}

export function StatCard({ title, value, icon, iconBg = "bg-blue-50", loading }: StatCardProps) {
  if (loading) {
    return (
      <Card className="border border-gray-100 shadow-sm">
        <CardContent className="p-6">
          <div className="flex items-start justify-between">
            <div className="space-y-2">
              <Skeleton className="h-4 w-28" />
              <Skeleton className="h-8 w-20" />
            </div>
            <Skeleton className="h-10 w-10 rounded-lg" />
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border border-gray-100 shadow-sm hover:shadow-md transition-shadow duration-200">
      <CardContent className="p-6">
        <div className="flex items-start justify-between">
          <div>
            <p className="text-sm text-gray-500 font-medium">{title}</p>
            <p className="text-3xl font-bold text-gray-900 mt-9">
              {typeof value === "number" ? value.toLocaleString() : value}
            </p>
          </div>
          <div className={cn("p-2.5 rounded-xl", iconBg)}>
            {icon}
          </div>
        </div>
      </CardContent>
    </Card>
  );
}