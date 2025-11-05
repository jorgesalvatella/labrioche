"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";
import { Croissant, Coffee, UtensilsCrossed } from "lucide-react";

const models = [
  {
    icon: Croissant,
    title: "Panadería Artesanal",
    description: "Pan francés auténtico con recetas originales. Contratos B2B con hoteles de lujo. Margen superior al 60%."
  },
  {
    icon: Coffee,
    title: "Cafetería Especializada",
    description: "Café de origen único y bebidas premium. Atrae turismo de alto nivel y expatriados. Ticket 30% superior."
  },
  {
    icon: UtensilsCrossed,
    title: "Restaurante Francés",
    description: "Experiencia gastronómica completa. Menú curado de clásicos franceses con precios premium justificados."
  }
];

function ModelCard({ model, index }: { model: typeof models[0]; index: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 50 }}
      animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
      transition={{ duration: 0.6, delay: index * 0.2 }}
      className="group text-center p-10 bg-cream/5 backdrop-blur-custom border border-gold/20 hover:bg-cream/10 hover:border-gold hover:-translate-y-2 transition-all duration-300"
    >
      <div className="mb-6 group-hover:scale-110 transition-transform duration-300 flex justify-center">
        <model.icon className="w-20 h-20 text-gold" strokeWidth={1.5} />
      </div>
      <h3 className="font-playfair text-3xl text-gold mb-4 font-semibold">
        {model.title}
      </h3>
      <p className="text-lg leading-relaxed text-cream/85">
        {model.description}
      </p>
    </motion.div>
  );
}

export default function BusinessModel() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="modelo" className="section-padding bg-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-20"
        >
          <p className="text-gold text-sm tracking-[0.3em] uppercase mb-4 font-semibold">
            Modelo de Negocio
          </p>
          <h2 className="font-playfair text-5xl md:text-7xl font-bold mb-6">
            Tres Líneas de Ingresos Diversificadas
          </h2>
          <p className="text-xl max-w-3xl mx-auto leading-relaxed opacity-85">
            Diversificación estratégica que maximiza rentabilidad y minimiza riesgo.
          </p>
        </motion.div>

        <div className="grid md:grid-cols-3 gap-8">
          {models.map((model, index) => (
            <ModelCard key={index} model={model} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
