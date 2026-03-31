import './globals.css';
import type { ReactNode } from 'react';

export const metadata = {
  title: 'Clinician Portal',
  description: 'Portal for NFC health patch review',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
