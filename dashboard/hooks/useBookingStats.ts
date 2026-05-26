"use client";

import { useState, useEffect, useCallback } from "react";
import { getBookingStats } from "@/app/api/tourismo";
import type { BookingStats } from "@/types";

export function useBookingStats() {
  const [stats, setStats] = useState<BookingStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetch = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await getBookingStats();
      setStats(data);
    } catch {
      setError("Failed to load booking stats");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { stats, loading, error, refetch: fetch };
}