"use client";

import { useState, useEffect, useCallback } from "react";
import { getSalesData } from "@/app/api/tourismo";
import type { SalesDataPoint } from "@/types";

export function useSalesData(month: string) {
  const [data, setData] = useState<SalesDataPoint[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetch = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      const result = await getSalesData(month);
      setData(result);
    } catch {
      setError("Failed to load sales data");
    } finally {
      setLoading(false);
    }
  }, [month]);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { data, loading, error, refetch: fetch };
}