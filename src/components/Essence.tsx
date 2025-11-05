"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

export default function Essence() {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section className="section-padding bg-gradient-to-br from-brown to-dark">
      <div className="container-custom">
        <motion.div
          ref={ref}
          initial={{ opacity: 0, scale: 0.95 }}
          animate={isInView ? { opacity: 1, scale: 1 } : { opacity: 0, scale: 0.95 }}
          transition={{ duration: 1 }}
          className="text-center max-w-5xl mx-auto"
        >
          <p className="font-playfair text-3xl md:text-5xl lg:text-6xl leading-relaxed font-medium italic">
            "No vendemos pan.<br />
            Creamos <span className="text-gold font-bold">momentos</span>,<br />
            compartimos <span className="text-gold font-bold">tradición</span>,<br />
            y ofrecemos una <span className="text-gold font-bold">experiencia</span><br />
            que permanece en la memoria."
          </p>
        </motion.div>
      </div>
    </section>
  );
}
