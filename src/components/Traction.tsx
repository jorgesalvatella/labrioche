"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const stats = [
  { number: "10", label: "Años Operando" },
  { number: "3", label: "Líneas de Negocio" },
  { number: "365", label: "Días de Producción" },
  { number: "∞", label: "Potencial de Crecimiento" }
];

function StatCard({ stat, index }: { stat: typeof stats[0]; index: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, scale: 0.8 }}
      animate={isInView ? { opacity: 1, scale: 1 } : { opacity: 0, scale: 0.8 }}
      transition={{ duration: 0.5, delay: index * 0.1 }}
      whileHover={{ scale: 1.05, y: -10 }}
      className="text-center p-10 bg-gradient-to-br from-gold/10 to-dark-gold/5 border border-gold/30 hover:border-gold hover:shadow-2xl hover:shadow-gold/20 transition-all duration-300"
    >
      <div className="font-playfair text-7xl text-gold font-bold mb-4 glow-gold">
        {stat.number}
      </div>
      <div className="text-sm uppercase tracking-widest text-cream/70">
        {stat.label}
      </div>
    </motion.div>
  );
}

export default function Traction() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="traccion" className="section-padding bg-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-20"
        >
          <p className="text-gold text-sm tracking-[0.3em] uppercase mb-4 font-semibold">
            Tracción
          </p>
          <h2 className="font-playfair text-5xl md:text-7xl font-bold mb-6">
            Validación del Mercado
          </h2>
          <p className="text-xl max-w-3xl mx-auto leading-relaxed opacity-85">
            Una década de resultados consistentes y reconocimiento orgánico comprobado.
          </p>
        </motion.div>

        <div className="grid md:grid-cols-4 gap-8">
          {stats.map((stat, index) => (
            <StatCard key={index} stat={stat} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
