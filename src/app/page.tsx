"use client";

import Hero from "@/components/Hero";
import Opportunity from "@/components/Opportunity";
import BusinessModel from "@/components/BusinessModel";
import Differentiation from "@/components/Differentiation";
import Traction from "@/components/Traction";
import Vision from "@/components/Vision";
import Essence from "@/components/Essence";
import CTA from "@/components/CTA";
import Navigation from "@/components/Navigation";

export default function Home() {
  return (
    <main className="relative">
      <Navigation />
      <Hero />
      <Opportunity />
      <BusinessModel />
      <Differentiation />
      <Traction />
      <Vision />
      <Essence />
      <CTA />
    </main>
  );
}
