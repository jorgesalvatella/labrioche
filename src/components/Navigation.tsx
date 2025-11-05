"use client";

import { useEffect, useState } from "react";
import { motion } from "framer-motion";

const sections = [
  { id: "hero", label: "Inicio" },
  { id: "oportunidad", label: "Oportunidad" },
  { id: "modelo", label: "Modelo" },
  { id: "diferenciacion", label: "Diferenciación" },
  { id: "traccion", label: "Tracción" },
  { id: "vision", label: "Visión" },
  { id: "contacto", label: "Contacto" }
];

export default function Navigation() {
  const [activeSection, setActiveSection] = useState(0);

  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = window.scrollY + window.innerHeight / 2;
      
      sections.forEach((section, index) => {
        const element = document.getElementById(section.id);
        if (element) {
          const { offsetTop, offsetHeight } = element;
          if (scrollPosition >= offsetTop && scrollPosition < offsetTop + offsetHeight) {
            setActiveSection(index);
          }
        }
      });
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    element?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <div className="fixed right-8 top-1/2 -translate-y-1/2 z-50 hidden lg:flex flex-col gap-6">
      {sections.map((section, index) => (
        <motion.button
          key={section.id}
          onClick={() => scrollToSection(section.id)}
          whileHover={{ scale: 1.3 }}
          className={`w-3 h-3 rounded-full border-2 transition-all duration-300 ${
            activeSection === index
              ? "bg-gold border-gold scale-125"
              : "border-gold/50 hover:border-gold"
          }`}
          aria-label={section.label}
        />
      ))}
    </div>
  );
}
