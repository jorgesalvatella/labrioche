"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const opportunities = [
  {
    number: "01",
    title: "Mercado Consolidado",
    text: "El segmento premium de panadería artesanal crece 15% anual. Playa del Carmen recibe 8M+ visitantes con alto poder adquisitivo."
  },
  {
    number: "02",
    title: "Marca Establecida",
    text: "10 años de operación continua, reconocimiento sólido y base de clientes leales en el destino turístico más visitado de Latinoamérica."
  },
  {
    number: "03",
    title: "Modelo Probado y Escalable",
    text: "Tres líneas de negocio rentables con procesos optimizados listos para replicación regional y nacional."
  }
];

function OpportunityCard({ opp, index }: { opp: typeof opportunities[0]; index: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 50 }}
      animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
      transition={{ duration: 0.6, delay: index * 0.2 }}
      className="group relative bg-gradient-to-br from-gold/10 to-dark-gold/5 p-8 border border-gold/20 overflow-hidden hover:border-gold/50 transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl hover:shadow-gold/20"
    >
      <div className="absolute inset-0 -translate-x-full group-hover:translate-x-full transition-transform duration-700 bg-gradient-to-r from-transparent via-gold/10 to-transparent" />
      
      <div className="relative z-10">
        <div className="font-playfair text-6xl font-bold text-gold/50 mb-6">
          {opp.number}
        </div>
        <h3 className="font-playfair text-2xl font-semibold mb-4 text-brown">
          {opp.title}
        </h3>
        <p className="text-lg leading-relaxed text-brown/80">
          {opp.text}
        </p>
      </div>
    </motion.div>
  );
}

export default function Opportunity() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="oportunidad" className="section-padding bg-cream text-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-20"
        >
          <p className="text-gold text-sm tracking-[0.3em] uppercase mb-4 font-semibold">
            Por qué ahora
          </p>
          <h2 className="font-playfair text-5xl md:text-7xl font-bold mb-6 text-brown">
            El Momento Perfecto
          </h2>
          <p className="text-xl max-w-3xl mx-auto leading-relaxed text-brown/85">
            Una década de validación de mercado con trayectoria comprobada y potencial de crecimiento exponencial.
          </p>
        </motion.div>

        <div className="grid md:grid-cols-3 gap-8">
          {opportunities.map((opp, index) => (
            <OpportunityCard key={index} opp={opp} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
