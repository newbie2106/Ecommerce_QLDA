// import { defineConfig } from 'vite'
// import react from '@vitejs/plugin-react'

// // https://vitejs.dev/config/
// export default defineConfig({
//   plugins: [react()],
// })


import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from 'tailwindcss'
import autoprefixer from 'autoprefixer'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    {
      enforce: 'pre',
      transform(src, id) {
        if (/\.html$/.test(id)) {
          return src.replace(/<body>(.*?)<\/body>/, '<body class="container mx-auto"> $1 </body>');
        }
        return src;
      },
    },
  ],
  css: {
    postcss: {
      plugins: [tailwindcss, autoprefixer],
    },
  },
})