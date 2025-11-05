#!/bin/bash

# Script para completar el proyecto Labrioche
# Ejecutar desde: /home/beto/projects/labrioche
# Uso: bash complete-labrioche.sh

echo "🚀 Completando proyecto Labrioche..."

# Verificar que estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Error: Ejecuta este script desde /home/beto/projects/labrioche"
    exit 1
fi

echo "📁 Creando archivos de configuración..."

# tsconfig.json
cat > tsconfig.json << 'EOFTS'
{
  "compilerOptions": {
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOFTS

# next.config.js
cat > next.config.js << 'EOFNEXT'
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['images.unsplash.com'],
  },
}

module.exports = nextConfig
EOFNEXT

# tailwind.config.ts
cat > tailwind.config.ts << 'EOFTW'
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        gold: '#D4A574',
        'dark-gold': '#C9A961',
        cream: '#FBF8F3',
        dark: '#0A0807',
        brown: '#3E2E24',
      },
      fontFamily: {
        playfair: ['Playfair Display', 'serif'],
        inter: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [],
};
export default config;
EOFTW

# postcss.config.js
cat > postcss.config.js << 'EOFPOST'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOFPOST

# .gitignore
cat > .gitignore << 'EOFGIT'
/node_modules
/.next/
/out/
/build
.DS_Store
*.pem
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.env*.local
.vercel
*.tsbuildinfo
next-env.d.ts
EOFGIT

echo "🎨 Creando archivos de la app..."

# globals.css
cat > src/app/globals.css << 'EOFCSS'
@tailwind base;
@tailwind components;
@tailwind utilities;

@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;900&family=Inter:wght@300;400;500;600;700&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  @apply bg-dark text-cream font-inter antialiased;
  overflow-x: hidden;
}

@layer utilities {
  .text-gradient {
    @apply bg-gradient-to-r from-gold via-dark-gold to-[#F5E6C8];
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .glow-gold {
    filter: drop-shadow(0 0 30px rgba(212, 165, 116, 0.5));
  }
  
  .backdrop-blur-custom {
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
  }
}

@layer components {
  .container-custom {
    @apply max-w-7xl mx-auto px-4 sm:px-6 lg:px-8;
  }
  
  .section-padding {
    @apply py-20 md:py-32;
  }
}
EOFCSS

# layout.tsx
cat > src/app/layout.tsx << 'EOFLAYOUT'
import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Labrioche - Investment Opportunity",
  description: "Una oportunidad excepcional de alto valor en el mercado gourmet premium de México",
  keywords: "inversión, panadería francesa, labrioche, playa del carmen",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body>{children}</body>
    </html>
  );
}
EOFLAYOUT

# page.tsx
cat > src/app/page.tsx << 'EOFPAGE'
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
EOFPAGE

echo "⚛️  Creando componentes React (1/9)..."

# Hero.tsx
cat > src/components/Hero.tsx << 'EOFHERO'
"use client";

import { motion } from "framer-motion";

export default function Hero() {
  return (
    <section id="hero" className="min-h-screen flex items-center justify-center relative overflow-hidden">
      <div className="absolute inset-0 bg-gradient-to-br from-dark via-[#1A1410] to-dark">
        <div className="absolute inset-0 opacity-30">
          <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-gold/20 rounded-full blur-3xl animate-pulse" />
          <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-dark-gold/20 rounded-full blur-3xl animate-pulse" />
        </div>
        <div 
          className="absolute inset-0 opacity-20"
          style={{
            backgroundImage: 'radial-gradient(circle, rgba(212, 165, 116, 0.1) 1px, transparent 1px)',
            backgroundSize: '30px 30px',
          }}
        />
      </div>

      <div className="relative z-10 text-center px-4">
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-gold text-sm tracking-[0.3em] uppercase mb-8 font-medium"
        >
          Oportunidad de Inversión
        </motion.p>

        <motion.h1
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 1, delay: 0.4 }}
          className="font-playfair text-7xl md:text-9xl lg:text-[12rem] font-black mb-4 text-gradient glow-gold"
        >
          LABRIOCHE
        </motion.h1>

        <motion.p
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.7 }}
          className="font-playfair text-2xl md:text-4xl tracking-widest mb-12 opacity-90"
        >
          Coffee Bar
        </motion.p>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 1 }}
          className="max-w-3xl mx-auto text-lg md:text-xl leading-relaxed opacity-80 border-t border-b border-gold/30 py-8"
        >
          Una oportunidad excepcional de alto valor en el mercado gourmet premium de México
        </motion.p>
      </div>

      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1, delay: 1.5 }}
        className="absolute bottom-10 left-1/2 -translate-x-1/2"
      >
        <div className="flex flex-col items-center gap-2 text-gold text-sm tracking-widest">
          <span>DESCUBRE MÁS</span>
          <motion.div
            animate={{ y: [0, 10, 0] }}
            transition={{ duration: 2, repeat: Infinity }}
            className="text-2xl"
          >
            ↓
          </motion.div>
        </div>
      </motion.div>
    </section>
  );
}
EOFHERO

echo "⚛️  Creando componentes React (2/9)..."

# Opportunity.tsx
cat > src/components/Opportunity.tsx << 'EOFOPPO'
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
        <div className="font-playfair text-6xl font-bold text-gold/30 mb-6">
          {opp.number}
        </div>
        <h3 className="font-playfair text-2xl font-semibold mb-4 text-cream">
          {opp.title}
        </h3>
        <p className="text-lg leading-relaxed text-cream/85">
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
EOFOPPO

echo "⚛️  Creando componentes React (3/9)..."

# BusinessModel.tsx
cat > src/components/BusinessModel.tsx << 'EOFBIZ'
"use client";

import { motion } from "framer-motion";
import { useInView } from "framer-motion";
import { useRef } from "react";

const models = [
  {
    icon: "🥐",
    title: "Panadería Artesanal",
    description: "Pan francés auténtico con recetas originales. Contratos B2B con hoteles de lujo. Margen superior al 60%."
  },
  {
    icon: "☕",
    title: "Cafetería Especializada",
    description: "Café de origen único y bebidas premium. Atrae turismo de alto nivel y expatriados. Ticket 30% superior."
  },
  {
    icon: "🍽️",
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
      <div className="text-7xl mb-6 group-hover:scale-110 transition-transform duration-300">
        {model.icon}
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
EOFBIZ

echo "⚛️  Creando componentes React (4/9)..."

# Differentiation.tsx
cat > src/components/Differentiation.tsx << 'EOFDIFF'
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
EOFDIFF

echo "⚛️  Creando componentes React (5/9)..."

# Traction.tsx
cat > src/components/Traction.tsx << 'EOFTRAC'
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
EOFTRAC

echo "⚛️  Creando componentes React (6/9)..."

# Vision.tsx
cat > src/components/Vision.tsx << 'EOFVIS'
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
EOFVIS

echo "⚛️  Creando componentes React (7/9)..."

# Essence.tsx
cat > src/components/Essence.tsx << 'EOFESS'
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
EOFESS

echo "⚛️  Creando componentes React (8/9)..."

# CTA.tsx
cat > src/components/CTA.tsx << 'EOFCTA'
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
EOFCTA

echo "⚛️  Creando componentes React (9/9)..."

# Navigation.tsx
cat > src/components/Navigation.tsx << 'EOFNAV'
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
EOFNAV

# README.md
cat > README.md << 'EOFREADME'
# Labrioche - Investment Pitch Deck

Presentación premium profesional creada con Next.js 14, TypeScript, Tailwind CSS y Framer Motion.

## 🚀 Instalación y Ejecución

### 1. Instalar dependencias
```bash
npm install
```

### 2. Ejecutar en modo desarrollo
```bash
npm run dev
```

La aplicación estará disponible en: **http://localhost:3000**

### 3. Build para producción
```bash
npm run build
npm start
```

## 🎯 Secciones

1. **Hero** - Portada impactante con animaciones
2. **Opportunity** - Oportunidad de mercado (3 cards)
3. **Business Model** - 3 líneas de negocio
4. **Differentiation** - 4 ventajas competitivas
5. **Traction** - Stats animados
6. **Vision** - Roadmap de 3 fases
7. **Essence** - Quote emocional
8. **CTA** - Contacto y llamado a la acción

## 🛠️ Comandos Útiles

```bash
npm run dev      # Desarrollo
npm run build    # Build
npm start        # Producción
npm run lint     # Lint
```

## 📧 Contacto

- **Email**: remy-marciano@hotmail.fr
- **Teléfono**: +52 984 142 7508
- **Instagram**: @labriochedeplaya
EOFREADME

echo ""
echo "✅ ¡Proyecto completado exitosamente!"
echo ""
echo "📦 Siguiente paso:"
echo "   npm install"
echo ""
echo "🚀 Para ejecutar:"
echo "   npm run dev"
echo ""
echo "🌐 Abre en tu navegador:"
echo "   http://localhost:3000"
echo ""
