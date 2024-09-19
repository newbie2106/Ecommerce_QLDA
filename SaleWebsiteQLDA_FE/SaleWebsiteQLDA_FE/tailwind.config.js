// /** @type {import('tailwindcss').Config} */
// export default {
//   content: ["./src/**/*.{html,jsx,js}"],
//   theme: {
//     extend: {},
//   },
//   plugins: [],
// }

/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{html,jsx,js}"],
  theme: {
    extend: {
      scale: {
        '120': '1.1',
      }
    },
  },
  plugins: [],
};