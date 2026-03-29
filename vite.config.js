import { defineConfig } from 'vite';

export default defineConfig({
  root: 'src',                    // index.html ada di dalam folder src
  build: {
    outDir: '../www',             // hasil build masuk ke folder www (Capacitor pakai ini)
    emptyOutDir: true,
    rollupOptions: {
      input: 'src/index.html'
    }
  },
  // Agar lebih cepat di development
  server: {
    port: 5173,
    open: true
  }
});
