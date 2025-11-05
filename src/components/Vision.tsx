"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const phases = [
  {
    phase: "I",
    label: "Fase 1",
    title: "Consolidación",
    description: "Optimización de operaciones actuales. Aumento de capacidad productiva y márgenes en ubicación establecida."
  },
  {
    phase: "II",
    label: "Fase 2",
    title: "Expansión Regional",
    description: "Tulum, Cancún, Cozumel. Replicación del modelo validado en Riviera Maya con alta demanda turística."
  },
  {
    phase: "III",
    label: "Fase 3",
    title: "Escalamiento Nacional",
    description: "CDMX, Guadalajara, Monterrey. Franquicias estratégicas para aceleración exponencial del crecimiento."
  }
];

function PhaseCard({ phase, index }: { phase: typeof phases[0]; index: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 50 }}
      animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
      transition={{ duration: 0.6, delay: index * 0.2 }}
      className="flex flex-col md:flex-row gap-8 items-center mb-16"
    >
      <div className="w-24 h-24 rounded-full bg-gradient-to-br from-gold to-dark-gold flex items-center justify-center font-playfair text-4xl font-bold text-dark shadow-2xl shadow-gold/40 flex-shrink-0">
        {phase.phase}
      </div>
      <div className="flex-1 bg-cream/5 backdrop-blur-custom p-8 border border-gold/20 hover:bg-cream/10 hover:border-gold transition-all duration-300">
        <p className="text-gold text-xs tracking-widest uppercase mb-3">
          {phase.label}
        </p>
        <h3 className="font-playfair text-3xl font-semibold mb-4">
          {phase.title}
        </h3>
        <p className="text-lg leading-relaxed opacity-85">
          {phase.description}
        </p>
      </div>
    </motion.div>
  );
}

export default function Vision() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="vision" className="section-padding bg-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-20"
        >
          <p className="text-gold text-sm tracking-[0.3em] uppercase mb-4 font-semibold">
            Escalabilidad
          </p>
          <h2 className="font-playfair text-5xl md:text-7xl font-bold mb-6">
            De Local a Nacional
          </h2>
          <p className="text-xl max-w-3xl mx-auto leading-relaxed opacity-85">
            Un modelo probado listo para replicarse en los principales destinos y ciudades de México.
          </p>
        </motion.div>

        <div className="max-w-4xl mx-auto">
          {phases.map((phase, index) => (
            <PhaseCard key={index} phase={phase} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
