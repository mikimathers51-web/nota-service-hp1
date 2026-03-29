import { defineConfig } from 'vite';

export default defineConfig({
  root: 'src',                    // index.html ada di folder src
  build: {
    outDir: '../www',             // output ke folder www (yang dipakai Capacitor)
    emptyOutDir: true,
    rollupOptions: {
      input: 'src/index.html'
    }
  }
});
