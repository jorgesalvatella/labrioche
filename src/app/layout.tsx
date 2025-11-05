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
