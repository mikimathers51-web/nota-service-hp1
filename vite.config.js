import { defineConfig } from 'vite';

export default defineConfig({
  root: 'src',
  build: {
    outDir: '../www',
    emptyOutDir: true,
    rollupOptions: {
      input: 'src/index.html'
    }
  },
  // PERBAIKAN UTAMA: Support Top-level await
  esbuild: {
    target: 'es2022'        // atau 'chrome100', 'safari15'
  },
  build: {
    target: 'es2022'        // Tambahkan ini juga
  }
});
