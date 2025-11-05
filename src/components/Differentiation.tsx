"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const advantages = [
  {
    number: "01",
    title: "Autenticidad Garantizada",
    text: "Recetas francesas originales transmitidas generacionalmente. No es reinterpretación: es tradición pura de París."
  },
  {
    number: "02",
    title: "Barrera de Entrada Alta",
    text: "Know-how de una década, relaciones con proveedores premium y reputación consolidada son imposibles de replicar."
  },
  {
    number: "03",
    title: "Posicionamiento de Lujo",
    text: "Percepción de marca establecida en segmento premium. Clientes dispuestos a pagar 40-60% más por calidad."
  },
  {
    number: "04",
    title: "Ecosistema Completo",
    text: "No es solo panadería: es experiencia, cultura y punto de encuentro. Valor emocional que trasciende el producto."
  }
];

function AdvantageCard({ adv, index }: { adv: typeof advantages[0]; index: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, x: index % 2 === 0 ? -50 : 50 }}
      animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: index % 2 === 0 ? -50 : 50 }}
      transition={{ duration: 0.6, delay: index * 0.15 }}
      className="bg-dark/40 backdrop-blur-custom border border-gold/20 p-8 border-l-4 border-l-gold hover:bg-dark/60 transition-colors duration-300"
    >
      <div className="font-playfair text-5xl text-gold font-bold mb-4">
        {adv.number}
      </div>
      <h3 className="font-playfair text-2xl font-semibold mb-4">
        {adv.title}
      </h3>
      <p className="text-lg leading-relaxed opacity-85">
        {adv.text}
      </p>
    </motion.div>
  );
}

export default function Differentiation() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="diferenciacion" className="section-padding bg-gradient-to-br from-brown to-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-20"
        >
          <p className="text-gold text-sm tracking-[0.3em] uppercase mb-4 font-semibold">
            Ventajas Competitivas
          </p>
          <h2 className="font-playfair text-5xl md:text-7xl font-bold mb-6">
            Diferenciación Irreplicable
          </h2>
          <p className="text-xl max-w-3xl mx-auto leading-relaxed opacity-85">
            Elementos únicos que protegen la inversión y garantizan liderazgo sostenido.
          </p>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-8">
          {advantages.map((adv, index) => (
            <AdvantageCard key={index} adv={adv} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
