"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const contacts = [
  { label: "Ubicación", value: "Playa del Carmen, México" },
  { label: "Email", value: "remy-marciano@hotmail.fr" },
  { label: "Teléfono", value: "+52 984 142 7508" },
  { label: "Síguenos", value: "@labriochedeplaya" }
];

export default function CTA() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section id="contacto" className="section-padding bg-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 50 }}
          animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
          transition={{ duration: 0.8 }}
          className="max-w-4xl mx-auto"
        >
          <div className="text-center p-12 md:p-16 bg-cream/5 backdrop-blur-custom border-2 border-gold">
            <h2 className="font-playfair text-4xl md:text-6xl text-gold font-bold mb-8">
              El Futuro del Gourmet Francés en México
            </h2>
            <p className="text-xl md:text-2xl leading-relaxed mb-10 opacity-90">
              Una oportunidad única de participar en un negocio consolidado con potencial de crecimiento excepcional en el mercado más dinámico de Latinoamérica.
            </p>
            
            <motion.a
              href="mailto:remy-marciano@hotmail.fr"
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="inline-block px-12 py-4 bg-gold text-dark font-semibold text-lg tracking-widest uppercase border-2 border-gold hover:bg-transparent hover:text-gold transition-all duration-300 mb-12"
            >
              Iniciar Conversación
            </motion.a>

            <div className="grid md:grid-cols-2 gap-6">
              {contacts.map((contact, index) => (
                <motion.div
                  key={index}
                  initial={{ opacity: 0, y: 20 }}
                  animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 20 }}
                  transition={{ duration: 0.5, delay: 0.8 + index * 0.1 }}
                  className="p-6 bg-dark/30 border border-gold/20 text-left"
                >
                  <div className="text-gold text-xs tracking-widest uppercase mb-2">
                    {contact.label}
                  </div>
                  <div className="text-xl">
                    {contact.value}
                  </div>
                </motion.div>
              ))}
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
